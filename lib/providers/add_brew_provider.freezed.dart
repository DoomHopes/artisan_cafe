// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_brew_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddBrewState {

 String get name; double get strength; String get volume; bool get isMilkBased; String get origin; String get roastLevel; String get brewMethod;
/// Create a copy of AddBrewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddBrewStateCopyWith<AddBrewState> get copyWith => _$AddBrewStateCopyWithImpl<AddBrewState>(this as AddBrewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddBrewState&&(identical(other.name, name) || other.name == name)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isMilkBased, isMilkBased) || other.isMilkBased == isMilkBased)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.roastLevel, roastLevel) || other.roastLevel == roastLevel)&&(identical(other.brewMethod, brewMethod) || other.brewMethod == brewMethod));
}


@override
int get hashCode => Object.hash(runtimeType,name,strength,volume,isMilkBased,origin,roastLevel,brewMethod);

@override
String toString() {
  return 'AddBrewState(name: $name, strength: $strength, volume: $volume, isMilkBased: $isMilkBased, origin: $origin, roastLevel: $roastLevel, brewMethod: $brewMethod)';
}


}

/// @nodoc
abstract mixin class $AddBrewStateCopyWith<$Res>  {
  factory $AddBrewStateCopyWith(AddBrewState value, $Res Function(AddBrewState) _then) = _$AddBrewStateCopyWithImpl;
@useResult
$Res call({
 String name, double strength, String volume, bool isMilkBased, String origin, String roastLevel, String brewMethod
});




}
/// @nodoc
class _$AddBrewStateCopyWithImpl<$Res>
    implements $AddBrewStateCopyWith<$Res> {
  _$AddBrewStateCopyWithImpl(this._self, this._then);

  final AddBrewState _self;
  final $Res Function(AddBrewState) _then;

/// Create a copy of AddBrewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? strength = null,Object? volume = null,Object? isMilkBased = null,Object? origin = null,Object? roastLevel = null,Object? brewMethod = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,isMilkBased: null == isMilkBased ? _self.isMilkBased : isMilkBased // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,roastLevel: null == roastLevel ? _self.roastLevel : roastLevel // ignore: cast_nullable_to_non_nullable
as String,brewMethod: null == brewMethod ? _self.brewMethod : brewMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddBrewState].
extension AddBrewStatePatterns on AddBrewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddBrewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddBrewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddBrewState value)  $default,){
final _that = this;
switch (_that) {
case _AddBrewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddBrewState value)?  $default,){
final _that = this;
switch (_that) {
case _AddBrewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddBrewState() when $default != null:
return $default(_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod)  $default,) {final _that = this;
switch (_that) {
case _AddBrewState():
return $default(_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod)?  $default,) {final _that = this;
switch (_that) {
case _AddBrewState() when $default != null:
return $default(_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod);case _:
  return null;

}
}

}

/// @nodoc


class _AddBrewState implements AddBrewState {
  const _AddBrewState({this.name = '', this.strength = 3.0, this.volume = '240ml', this.isMilkBased = false, this.origin = 'Ethiopia', this.roastLevel = 'Medium', this.brewMethod = 'v60'});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  double strength;
@override@JsonKey() final  String volume;
@override@JsonKey() final  bool isMilkBased;
@override@JsonKey() final  String origin;
@override@JsonKey() final  String roastLevel;
@override@JsonKey() final  String brewMethod;

/// Create a copy of AddBrewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddBrewStateCopyWith<_AddBrewState> get copyWith => __$AddBrewStateCopyWithImpl<_AddBrewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddBrewState&&(identical(other.name, name) || other.name == name)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isMilkBased, isMilkBased) || other.isMilkBased == isMilkBased)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.roastLevel, roastLevel) || other.roastLevel == roastLevel)&&(identical(other.brewMethod, brewMethod) || other.brewMethod == brewMethod));
}


@override
int get hashCode => Object.hash(runtimeType,name,strength,volume,isMilkBased,origin,roastLevel,brewMethod);

@override
String toString() {
  return 'AddBrewState(name: $name, strength: $strength, volume: $volume, isMilkBased: $isMilkBased, origin: $origin, roastLevel: $roastLevel, brewMethod: $brewMethod)';
}


}

/// @nodoc
abstract mixin class _$AddBrewStateCopyWith<$Res> implements $AddBrewStateCopyWith<$Res> {
  factory _$AddBrewStateCopyWith(_AddBrewState value, $Res Function(_AddBrewState) _then) = __$AddBrewStateCopyWithImpl;
@override @useResult
$Res call({
 String name, double strength, String volume, bool isMilkBased, String origin, String roastLevel, String brewMethod
});




}
/// @nodoc
class __$AddBrewStateCopyWithImpl<$Res>
    implements _$AddBrewStateCopyWith<$Res> {
  __$AddBrewStateCopyWithImpl(this._self, this._then);

  final _AddBrewState _self;
  final $Res Function(_AddBrewState) _then;

/// Create a copy of AddBrewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? strength = null,Object? volume = null,Object? isMilkBased = null,Object? origin = null,Object? roastLevel = null,Object? brewMethod = null,}) {
  return _then(_AddBrewState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,isMilkBased: null == isMilkBased ? _self.isMilkBased : isMilkBased // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,roastLevel: null == roastLevel ? _self.roastLevel : roastLevel // ignore: cast_nullable_to_non_nullable
as String,brewMethod: null == brewMethod ? _self.brewMethod : brewMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
