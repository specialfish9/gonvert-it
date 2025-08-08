part of 'split_bloc.dart';

@freezed
abstract class SplitState with _$SplitState {
  const factory SplitState.initial({
    final File? file,
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    final String? error,
  }) = _Initial;
}
