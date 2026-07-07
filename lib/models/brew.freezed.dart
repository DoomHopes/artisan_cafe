// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brew.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Brew {

 String get id; String get name; int get strength; String get volume; bool get isMilkBased; String get origin; String get roastLevel; String get brewMethod; int get caffeine; DateTime get createdAt;
/// Create a copy of Brew
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrewCopyWith<Brew> get copyWith => _$BrewCopyWithImpl<Brew>(this as Brew, _$identity);

  /// Serializes this Brew to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brew&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isMilkBased, isMilkBased) || other.isMilkBased == isMilkBased)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.roastLevel, roastLevel) || other.roastLevel == roastLevel)&&(identical(other.brewMethod, brewMethod) || other.brewMethod == brewMethod)&&(identical(other.caffeine, caffeine) || other.caffeine == caffeine)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,strength,volume,isMilkBased,origin,roastLevel,brewMethod,caffeine,createdAt);

@override
String toString() {
  return 'Brew(id: $id, name: $name, strength: $strength, volume: $volume, isMilkBased: $isMilkBased, origin: $origin, roastLevel: $roastLevel, brewMethod: $brewMethod, caffeine: $caffeine, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BrewCopyWith<$Res>  {
  factory $BrewCopyWith(Brew value, $Res Function(Brew) _then) = _$BrewCopyWithImpl;
@useResult
$Res call({
 String id, String name, int strength, String volume, bool isMilkBased, String origin, String roastLevel, String brewMethod, int caffeine, DateTime createdAt
});




}
/// @nodoc
class _$BrewCopyWithImpl<$Res>
    implements $BrewCopyWith<$Res> {
  _$BrewCopyWithImpl(this._self, this._then);

  final Brew _self;
  final $Res Function(Brew) _then;

/// Create a copy of Brew
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? strength = null,Object? volume = null,Object? isMilkBased = null,Object? origin = null,Object? roastLevel = null,Object? brewMethod = null,Object? caffeine = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,isMilkBased: null == isMilkBased ? _self.isMilkBased : isMilkBased // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,roastLevel: null == roastLevel ? _self.roastLevel : roastLevel // ignore: cast_nullable_to_non_nullable
as String,brewMethod: null == brewMethod ? _self.brewMethod : brewMethod // ignore: cast_nullable_to_non_nullable
as String,caffeine: null == caffeine ? _self.caffeine : caffeine // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Brew].
extension BrewPatterns on Brew {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brew value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brew() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brew value)  $default,){
final _that = this;
switch (_that) {
case _Brew():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brew value)?  $default,){
final _that = this;
switch (_that) {
case _Brew() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod,  int caffeine,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brew() when $default != null:
return $default(_that.id,_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod,_that.caffeine,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod,  int caffeine,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Brew():
return $default(_that.id,_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod,_that.caffeine,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int strength,  String volume,  bool isMilkBased,  String origin,  String roastLevel,  String brewMethod,  int caffeine,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Brew() when $default != null:
return $default(_that.id,_that.name,_that.strength,_that.volume,_that.isMilkBased,_that.origin,_that.roastLevel,_that.brewMethod,_that.caffeine,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brew implements Brew {
  const _Brew({required this.id, required this.name, required this.strength, required this.volume, required this.isMilkBased, required this.origin, required this.roastLevel, required this.brewMethod, required this.caffeine, required this.createdAt});
  factory _Brew.fromJson(Map<String, dynamic> json) => _$BrewFromJson(json);

@override final  String id;
@override final  String name;
@override final  int strength;
@override final  String volume;
@override final  bool isMilkBased;
@override final  String origin;
@override final  String roastLevel;
@override final  String brewMethod;
@override final  int caffeine;
@override final  DateTime createdAt;

/// Create a copy of Brew
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrewCopyWith<_Brew> get copyWith => __$BrewCopyWithImpl<_Brew>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brew&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isMilkBased, isMilkBased) || other.isMilkBased == isMilkBased)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.roastLevel, roastLevel) || other.roastLevel == roastLevel)&&(identical(other.brewMethod, brewMethod) || other.brewMethod == brewMethod)&&(identical(other.caffeine, caffeine) || other.caffeine == caffeine)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,strength,volume,isMilkBased,origin,roastLevel,brewMethod,caffeine,createdAt);

@override
String toString() {
  return 'Brew(id: $id, name: $name, strength: $strength, volume: $volume, isMilkBased: $isMilkBased, origin: $origin, roastLevel: $roastLevel, brewMethod: $brewMethod, caffeine: $caffeine, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BrewCopyWith<$Res> implements $BrewCopyWith<$Res> {
  factory _$BrewCopyWith(_Brew value, $Res Function(_Brew) _then) = __$BrewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int strength, String volume, bool isMilkBased, String origin, String roastLevel, String brewMethod, int caffeine, DateTime createdAt
});




}
/// @nodoc
class __$BrewCopyWithImpl<$Res>
    implements _$BrewCopyWith<$Res> {
  __$BrewCopyWithImpl(this._self, this._then);

  final _Brew _self;
  final $Res Function(_Brew) _then;

/// Create a copy of Brew
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? strength = null,Object? volume = null,Object? isMilkBased = null,Object? origin = null,Object? roastLevel = null,Object? brewMethod = null,Object? caffeine = null,Object? createdAt = null,}) {
  return _then(_Brew(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,isMilkBased: null == isMilkBased ? _self.isMilkBased : isMilkBased // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,roastLevel: null == roastLevel ? _self.roastLevel : roastLevel // ignore: cast_nullable_to_non_nullable
as String,brewMethod: null == brewMethod ? _self.brewMethod : brewMethod // ignore: cast_nullable_to_non_nullable
as String,caffeine: null == caffeine ? _self.caffeine : caffeine // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
