part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({final List<JsonOperation>? operations}) = _HomeState;
}
