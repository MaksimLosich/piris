import 'package:freezed_annotation/freezed_annotation.dart';

part 'disability.freezed.dart';
part 'disability.g.dart';

@freezed
class Disability with _$Disability {
  const factory Disability({
    required String name,
    required String? id,
  }) = _Disability;

  factory Disability.fromJson(Map<String, Object?> json)
  => _$DisabilityFromJson(json);

  @override
  String toString() {
    return name;
  }
}