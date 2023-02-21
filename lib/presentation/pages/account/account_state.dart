import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/account.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    required Account? account,
}) = _AccountState;
}
