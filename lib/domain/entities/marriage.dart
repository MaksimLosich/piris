import 'package:freezed_annotation/freezed_annotation.dart';

part 'marriage.freezed.dart';

@freezed
class Marriage with _$Marriage {
  const factory Marriage({
    required String name,
    required int id,
  }) = _Marriage;

  factory Marriage.fromJson(Map<String, Object?> json)
  => _$MarriageFromJson(json);
}