import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/domain/entities/deposit.dart';
import 'package:piris1/domain/entities/user.dart';

part 'deposits_state.freezed.dart';

@freezed
class DepositsState with _$DepositsState {
  const factory DepositsState({
    @Default([]) List<User> users,
    @Default([]) List<Account> accounts,
    @Default([]) List<Deposit> deposits,
  }) = _DepositsState;
}
