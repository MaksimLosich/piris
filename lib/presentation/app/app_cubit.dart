import 'dart:ui';

import '../base/base_cubit.dart';
import 'app_state.dart';

class AppCubit extends BaseCubit<AppState> {
  AppCubit()
      : super(
          AppState(),
        );
}
