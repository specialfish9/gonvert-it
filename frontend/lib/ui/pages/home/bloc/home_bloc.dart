import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/repository/models/json_operation.dart';
import 'package:frontend/repository/pdf_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../bloc_utils.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PdfRepository _pdfRepository;

  HomeBloc(this._pdfRepository) : super(HomeState()) {
    dropOn<_Init>(_init);

    add(_Init());
  }

  void _init(_, emit) {
    emit(state.copyWith(operations: _pdfRepository.operations));
  }
}
