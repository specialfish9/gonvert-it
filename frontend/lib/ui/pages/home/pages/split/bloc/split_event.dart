part of 'split_bloc.dart';

@freezed
abstract class SplitEvent with _$SplitEvent {
  const factory SplitEvent.fileDropped(DropItem dropItem) = _FileDropped;
  const factory SplitEvent.dropAreaTapped() = _DropAreaTapped;
  const factory SplitEvent.onSubmit() = _OnSubmit;
}
