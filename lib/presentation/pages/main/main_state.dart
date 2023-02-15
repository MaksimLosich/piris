import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piris1/domain/entities/user.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<User> users,
  }) = _MainState;
}
