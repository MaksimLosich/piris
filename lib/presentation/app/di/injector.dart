import 'package:get_it/get_it.dart';
import 'package:piris1/data/data_sources/firestore_remote_data_source.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/account/account_cubit.dart';
import 'package:piris1/presentation/pages/deposit/deposit_cubit.dart';
import 'package:piris1/presentation/pages/deposits/deposits_cubit.dart';
import 'package:piris1/presentation/pages/details/details_cubit.dart';
import 'package:piris1/presentation/pages/edit/edit_cubit.dart';

import '../../pages/main/main_cubit.dart';
import '../app_cubit.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  _initDataSources();
  _initRepositories();
  _initInteractors();
  _initCubits();
}

void _initDataSources() {
  i.registerSingleton<FirestoreRemoteDataSource>(FirestoreRemoteDataSourceImpl());
}

void _initRepositories() {}

void _initInteractors() {}

void _initCubits() {
  i.registerFactory<AppCubit>(() => AppCubit());
  i.registerFactory<MainCubit>(() => MainCubit(i.get()));
  i.registerFactory<DepositsCubit>(() => DepositsCubit(i.get()));
  i.registerFactory<DepositCubit>(() => DepositCubit(i.get()));
  i.registerFactory<DetailsCubit>(() => DetailsCubit(i.get()));
  i.registerFactory<AccountCubit>(() => AccountCubit(i.get()));
  i.registerFactory<EditCubit>(() => EditCubit(i.get()));
}
