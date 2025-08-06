// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplitEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitEvent()';
}


}

/// @nodoc
class $SplitEventCopyWith<$Res>  {
$SplitEventCopyWith(SplitEvent _, $Res Function(SplitEvent) __);
}


/// Adds pattern-matching-related methods to [SplitEvent].
extension SplitEventPatterns on SplitEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FileDropped value)?  fileDropped,TResult Function( _DropAreaTapped value)?  dropAreaTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileDropped() when fileDropped != null:
return fileDropped(_that);case _DropAreaTapped() when dropAreaTapped != null:
return dropAreaTapped(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FileDropped value)  fileDropped,required TResult Function( _DropAreaTapped value)  dropAreaTapped,}){
final _that = this;
switch (_that) {
case _FileDropped():
return fileDropped(_that);case _DropAreaTapped():
return dropAreaTapped(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FileDropped value)?  fileDropped,TResult? Function( _DropAreaTapped value)?  dropAreaTapped,}){
final _that = this;
switch (_that) {
case _FileDropped() when fileDropped != null:
return fileDropped(_that);case _DropAreaTapped() when dropAreaTapped != null:
return dropAreaTapped(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DropItem dropItem)?  fileDropped,TResult Function()?  dropAreaTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileDropped() when fileDropped != null:
return fileDropped(_that.dropItem);case _DropAreaTapped() when dropAreaTapped != null:
return dropAreaTapped();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DropItem dropItem)  fileDropped,required TResult Function()  dropAreaTapped,}) {final _that = this;
switch (_that) {
case _FileDropped():
return fileDropped(_that.dropItem);case _DropAreaTapped():
return dropAreaTapped();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DropItem dropItem)?  fileDropped,TResult? Function()?  dropAreaTapped,}) {final _that = this;
switch (_that) {
case _FileDropped() when fileDropped != null:
return fileDropped(_that.dropItem);case _DropAreaTapped() when dropAreaTapped != null:
return dropAreaTapped();case _:
  return null;

}
}

}

/// @nodoc


class _FileDropped implements SplitEvent {
  const _FileDropped(this.dropItem);
  

 final  DropItem dropItem;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileDroppedCopyWith<_FileDropped> get copyWith => __$FileDroppedCopyWithImpl<_FileDropped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileDropped&&(identical(other.dropItem, dropItem) || other.dropItem == dropItem));
}


@override
int get hashCode => Object.hash(runtimeType,dropItem);

@override
String toString() {
  return 'SplitEvent.fileDropped(dropItem: $dropItem)';
}


}

/// @nodoc
abstract mixin class _$FileDroppedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory _$FileDroppedCopyWith(_FileDropped value, $Res Function(_FileDropped) _then) = __$FileDroppedCopyWithImpl;
@useResult
$Res call({
 DropItem dropItem
});




}
/// @nodoc
class __$FileDroppedCopyWithImpl<$Res>
    implements _$FileDroppedCopyWith<$Res> {
  __$FileDroppedCopyWithImpl(this._self, this._then);

  final _FileDropped _self;
  final $Res Function(_FileDropped) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dropItem = null,}) {
  return _then(_FileDropped(
null == dropItem ? _self.dropItem : dropItem // ignore: cast_nullable_to_non_nullable
as DropItem,
  ));
}


}

/// @nodoc


class _DropAreaTapped implements SplitEvent {
  const _DropAreaTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropAreaTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitEvent.dropAreaTapped()';
}


}




/// @nodoc
mixin _$SplitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitState()';
}


}

/// @nodoc
class $SplitStateCopyWith<$Res>  {
$SplitStateCopyWith(SplitState _, $Res Function(SplitState) __);
}


/// Adds pattern-matching-related methods to [SplitState].
extension SplitStatePatterns on SplitState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SplitState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitState.initial()';
}


}




// dart format on
