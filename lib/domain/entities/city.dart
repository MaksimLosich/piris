import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';

@freezed
class City with _$City {
  const factory City({
    required String name,
    required int id,
  }) = _City;

  factory City.fromJson(Map<String, Object?> json)
  => _$CityFromJson(json);
}