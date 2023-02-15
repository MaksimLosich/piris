import 'package:freezed_annotation/freezed_annotation.dart';

part 'marriage.freezed.dart';
part 'marriage.g.dart';

@freezed
class Marriage with _$Marriage {
  const factory Marriage({
    required String name,
    required String? id,
  }) = _Marriage;

  factory Marriage.fromJson(Map<String, Object?> json)
  => _$MarriageFromJson(json);

  @override
  String toString() {
    return name;
  }
}