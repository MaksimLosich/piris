import 'package:get_it/get_it.dart';
import 'package:piris1/presentation/main/main_cubit.dart';

import '../app_cubit.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  _initDataSources();
  _initRepositories();
  _initInteractors();
  _initCubits();
}

void _initDataSources() {}

void _initRepositories() {}

void _initInteractors() {}

void _initCubits() {
  i.registerFactory<MainCubit>(() => MainCubit());
  i.registerFactory<AppCubit>(() => AppCubit());
}
