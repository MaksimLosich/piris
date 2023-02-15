import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/main/main_state.dart';

class MainCubit extends Cubit<MainState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  MainCubit(this._firestoreRemoteDataSource) : super(const MainState());

  void init() {
    _firestoreRemoteDataSource.getUsers().then((value) => emit(state.copyWith(users: value)));
  }
}
