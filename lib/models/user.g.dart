// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  password: json['password'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  dailyGoal: (json['dailyGoal'] as num?)?.toInt() ?? 3,
  remindersEnabled: json['remindersEnabled'] as bool? ?? true,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'password': instance.password,
  'name': instance.name,
  'createdAt': instance.createdAt.toIso8601String(),
  'dailyGoal': instance.dailyGoal,
  'remindersEnabled': instance.remindersEnabled,
};
