import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    required String middleName,
    required DateTime birthDate,
    required bool gender,
    required String passportSeries,
    required String passportNumber,
    required String passGiver,
    required DateTime passportDate,
    required String passportIdNumber,
    required String birthPlace,
    required City city,
    required String address,
    String? phone,
    String? cell,
    String? email,
    String? workplace,
    String? workPos,
    required City passportCity,
    required String passportAddress,
    required Marriage marriage,
    required Citizenship citizenship,
    required Disability disability,
    required bool isAged,
    required bool military,
    double? income,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
  => _$UserFromJson(json);
}