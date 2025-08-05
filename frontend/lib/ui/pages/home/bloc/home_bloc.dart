import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  HomeBloc(this._pdfRepository) : super(HomeState.initial()) {
    dropOn<_Init>(_init);
    debounceOn<_SearchChanged>(_searchChanged);

    state.searchController.addListener(() => add(_SearchChanged()));
    add(_Init());
  }

  void _init(_, emit) {
    final ops = _pdfRepository.operations;
    emit(state.copyWith(operations: ops, filteredOperations: ops));
  }

  void _searchChanged(_, emit) {
    final search = state.searchController.text;

    final ops =
        state.operations
            ?.where(
              (op) => op.name.toLowerCase().startsWith(search.toLowerCase()),
            )
            .toList() ??
        [];
    emit(state.copyWith(filteredOperations: ops));
  }
}
