// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SearchChanged value)?  searchChanged,TResult Function( _OperationSelected value)?  operationSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SearchChanged() when searchChanged != null:
return searchChanged(_that);case _OperationSelected() when operationSelected != null:
return operationSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SearchChanged value)  searchChanged,required TResult Function( _OperationSelected value)  operationSelected,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SearchChanged():
return searchChanged(_that);case _OperationSelected():
return operationSelected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SearchChanged value)?  searchChanged,TResult? Function( _OperationSelected value)?  operationSelected,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SearchChanged() when searchChanged != null:
return searchChanged(_that);case _OperationSelected() when operationSelected != null:
return operationSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  searchChanged,TResult Function( JsonOperation operation)?  operationSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SearchChanged() when searchChanged != null:
return searchChanged();case _OperationSelected() when operationSelected != null:
return operationSelected(_that.operation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  searchChanged,required TResult Function( JsonOperation operation)  operationSelected,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SearchChanged():
return searchChanged();case _OperationSelected():
return operationSelected(_that.operation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  searchChanged,TResult? Function( JsonOperation operation)?  operationSelected,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SearchChanged() when searchChanged != null:
return searchChanged();case _OperationSelected() when operationSelected != null:
return operationSelected(_that.operation);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements HomeEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.init()';
}


}




/// @nodoc


class _SearchChanged implements HomeEvent {
  const _SearchChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.searchChanged()';
}


}




/// @nodoc


class _OperationSelected implements HomeEvent {
  const _OperationSelected(this.operation);
  

 final  JsonOperation operation;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationSelectedCopyWith<_OperationSelected> get copyWith => __$OperationSelectedCopyWithImpl<_OperationSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationSelected&&(identical(other.operation, operation) || other.operation == operation));
}


@override
int get hashCode => Object.hash(runtimeType,operation);

@override
String toString() {
  return 'HomeEvent.operationSelected(operation: $operation)';
}


}

/// @nodoc
abstract mixin class _$OperationSelectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$OperationSelectedCopyWith(_OperationSelected value, $Res Function(_OperationSelected) _then) = __$OperationSelectedCopyWithImpl;
@useResult
$Res call({
 JsonOperation operation
});




}
/// @nodoc
class __$OperationSelectedCopyWithImpl<$Res>
    implements _$OperationSelectedCopyWith<$Res> {
  __$OperationSelectedCopyWithImpl(this._self, this._then);

  final _OperationSelected _self;
  final $Res Function(_OperationSelected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operation = null,}) {
  return _then(_OperationSelected(
null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as JsonOperation,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 List<JsonOperation>? get operations; List<JsonOperation>? get filteredOperations; TextEditingController get searchController;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.operations, operations)&&const DeepCollectionEquality().equals(other.filteredOperations, filteredOperations)&&(identical(other.searchController, searchController) || other.searchController == searchController));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(operations),const DeepCollectionEquality().hash(filteredOperations),searchController);

@override
String toString() {
  return 'HomeState(operations: $operations, filteredOperations: $filteredOperations, searchController: $searchController)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<JsonOperation>? operations, List<JsonOperation>? filteredOperations, TextEditingController searchController
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operations = freezed,Object? filteredOperations = freezed,Object? searchController = null,}) {
  return _then(_self.copyWith(
operations: freezed == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<JsonOperation>?,filteredOperations: freezed == filteredOperations ? _self.filteredOperations : filteredOperations // ignore: cast_nullable_to_non_nullable
as List<JsonOperation>?,searchController: null == searchController ? _self.searchController : searchController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JsonOperation>? operations,  List<JsonOperation>? filteredOperations,  TextEditingController searchController)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.operations,_that.filteredOperations,_that.searchController);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JsonOperation>? operations,  List<JsonOperation>? filteredOperations,  TextEditingController searchController)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.operations,_that.filteredOperations,_that.searchController);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JsonOperation>? operations,  List<JsonOperation>? filteredOperations,  TextEditingController searchController)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.operations,_that.filteredOperations,_that.searchController);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({final  List<JsonOperation>? operations, final  List<JsonOperation>? filteredOperations, required this.searchController}): _operations = operations,_filteredOperations = filteredOperations;
  

 final  List<JsonOperation>? _operations;
@override List<JsonOperation>? get operations {
  final value = _operations;
  if (value == null) return null;
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<JsonOperation>? _filteredOperations;
@override List<JsonOperation>? get filteredOperations {
  final value = _filteredOperations;
  if (value == null) return null;
  if (_filteredOperations is EqualUnmodifiableListView) return _filteredOperations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  TextEditingController searchController;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._operations, _operations)&&const DeepCollectionEquality().equals(other._filteredOperations, _filteredOperations)&&(identical(other.searchController, searchController) || other.searchController == searchController));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations),const DeepCollectionEquality().hash(_filteredOperations),searchController);

@override
String toString() {
  return 'HomeState(operations: $operations, filteredOperations: $filteredOperations, searchController: $searchController)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<JsonOperation>? operations, List<JsonOperation>? filteredOperations, TextEditingController searchController
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operations = freezed,Object? filteredOperations = freezed,Object? searchController = null,}) {
  return _then(_HomeState(
operations: freezed == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<JsonOperation>?,filteredOperations: freezed == filteredOperations ? _self._filteredOperations : filteredOperations // ignore: cast_nullable_to_non_nullable
as List<JsonOperation>?,searchController: null == searchController ? _self.searchController : searchController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}


}

// dart format on
