import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/repository/pdf_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../bloc_utils.dart';
import 'dart:io';

part 'split_event.dart';

part 'split_state.dart';

part 'split_bloc.freezed.dart';

@injectable
class SplitBloc extends Bloc<SplitEvent, SplitState> {
  final PdfRepository _pdfRepository;

  SplitBloc(this._pdfRepository) : super(const SplitState.initial()) {
    dropOn<_FileDropped>(_fileDropped);
    dropOn<_DropAreaTapped>(_dropAreaTapped);
  }

  Future<void> _fileDropped(
    _FileDropped event,
    Emitter<SplitState> emit,
  ) async {
    await _handleFile(event.dropItem.path);
  }

  Future<void> _dropAreaTapped(_, emit) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null || result.files.isEmpty) {
      return;
    }

    await _handleFile(result.files.first.path!);
  }

  Future<void> _handleFile(String path) async {
    // read file
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('File does not exist: $path');
    }

    final a = await file.readAsBytes();
    await _pdfRepository.split(file);
  }
}
