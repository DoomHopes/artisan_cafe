import 'package:freezed_annotation/freezed_annotation.dart';

part 'brew.freezed.dart';
part 'brew.g.dart';

@freezed
abstract class Brew with _$Brew {
  const factory Brew({
    required String id,
    required String name,
    required int strength,
    required String volume,
    required bool isMilkBased,
    required String origin,
    required String roastLevel,
    required String brewMethod,
    required int caffeine,
    required DateTime createdAt,
  }) = _Brew;

  factory Brew.fromJson(Map<String, Object?> json) => _$BrewFromJson(json);
}
