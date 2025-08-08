import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/repository/pdf_repository.dart';
import 'package:frontend/ui/pages/home/pages/split/bloc/split_side_effect.dart';
import 'package:frontend/ui/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';
import '../../../../../bloc_utils.dart';
import 'dart:io';

import '../../../../../side_effect.dart';

part 'split_event.dart';

part 'split_state.dart';

part 'split_bloc.freezed.dart';

@injectable
class SplitBloc extends Bloc<SplitEvent, SplitState>
    with SideEffect<SplitSideEffect> {
  final PdfRepository _pdfRepository;

  SplitBloc(this._pdfRepository) : super(const SplitState.initial()) {
    dropOn<_FileDropped>(_fileDropped);
    dropOn<_DropAreaTapped>(_dropAreaTapped);
    dropOn<_OnSubmit>(_onSubmit);
  }

  Future<void> _fileDropped(
    _FileDropped event,
    Emitter<SplitState> emit,
  ) async {
    await _handleFile(emit, event.dropItem.path);
  }

  Future<void> _dropAreaTapped(_, Emitter<SplitState> emit) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null || result.files.isEmpty) {
      return;
    }

    await _handleFile(emit, result.files.first.path!);
  }

  Future<void> _handleFile(Emitter<SplitState> emit, String path) async {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('File does not exist: $path');
    }

    emit(state.copyWith(file: file));
  }

  Future<void> _onSubmit(_, Emitter<SplitState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final bytes = await _pdfRepository.split(state.file!);
      if (bytes.isEmpty) {
        throw Exception('No pages were extracted from the PDF.');
      }

      // Convert List<int> to Uint8List for file_saver
      final uint8List = Uint8List.fromList(bytes);

      // Generate a filename based on the original file
      final originalFileName = state.file!.name;
      final baseFileName = originalFileName.replaceAll('.pdf', '');
      final zipFileName = '${baseFileName}_split_pages.zip';

      // Save/download the zip file
      await FileSaver.instance.saveFile(
        name: zipFileName,
        bytes: uint8List,
        mimeType: MimeType.zip,
      );

      emit(state.copyWith(isLoading: false, isCompleted: true));
      emitSideEffect(SplitSideEffect.downloaded(zipFileName));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
      emitSideEffect(SplitSideEffect.error(e.toString()));
      rethrow;
    }
  }
}
