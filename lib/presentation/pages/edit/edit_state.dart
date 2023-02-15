import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';

part 'edit_state.freezed.dart';

@freezed
class EditState with _$EditState {
  const factory EditState({
    @Default([]) List<City> cities,
    @Default([]) List<Citizenship> citizenships,
    @Default([]) List<Marriage> marriages,
    @Default([]) List<Disability> disabilities,
    DateTime? birthday,
    DateTime? passportDate,
    City? city,
    City? passportCity,
    Marriage? marriage,
    Citizenship? citizenship,
    Disability? disability,
    @Default(false) bool isAged,
    @Default(false) bool military,
    @Default(false) bool gender,
  }) = _EditState;
}
