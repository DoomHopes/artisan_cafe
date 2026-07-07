// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Brew _$BrewFromJson(Map<String, dynamic> json) => _Brew(
  id: json['id'] as String,
  name: json['name'] as String,
  strength: (json['strength'] as num).toInt(),
  volume: json['volume'] as String,
  isMilkBased: json['isMilkBased'] as bool,
  origin: json['origin'] as String,
  roastLevel: json['roastLevel'] as String,
  brewMethod: json['brewMethod'] as String,
  caffeine: (json['caffeine'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$BrewToJson(_Brew instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'strength': instance.strength,
  'volume': instance.volume,
  'isMilkBased': instance.isMilkBased,
  'origin': instance.origin,
  'roastLevel': instance.roastLevel,
  'brewMethod': instance.brewMethod,
  'caffeine': instance.caffeine,
  'createdAt': instance.createdAt.toIso8601String(),
};
