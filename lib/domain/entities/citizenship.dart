import 'package:freezed_annotation/freezed_annotation.dart';

part 'citizenship.freezed.dart';

@freezed
class Citizenship with _$Citizenship {
  const factory Citizenship({
    required String name,
    required int id,
  }) = _Citizenship;

  factory Citizenship.fromJson(Map<String, Object?> json)
  => _$CitizenshipFromJson(json);
}