import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/user.dart';

part 'deposit_state.freezed.dart';

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    @Default([]) List<User> users,
    User? user,
    @Default(true) bool revokable,
    @Default(1) int currency,
  }) = _DepositState;
}
