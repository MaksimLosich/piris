import 'package:freezed_annotation/freezed_annotation.dart';

part 'citizenship.freezed.dart';
part 'citizenship.g.dart';

@freezed
class Citizenship with _$Citizenship {
  const factory Citizenship({
    required String name,
    required String? id,
  }) = _Citizenship;

  factory Citizenship.fromJson(Map<String, Object?> json)
  => _$CitizenshipFromJson(json);

  @override
  String toString() {
    return name;
  }
}