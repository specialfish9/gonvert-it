part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    final List<JsonOperation>? operations,
    final List<JsonOperation>? filteredOperations,
    required final TextEditingController searchController,
  }) = _HomeState;

  // initial
  factory HomeState.initial({final List<JsonOperation>? operations}) =>
      _HomeState(
        operations: operations,
        filteredOperations: operations,
        searchController: TextEditingController(),
      );
}