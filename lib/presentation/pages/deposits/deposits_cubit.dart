import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/deposits/deposits_state.dart';

class DepositsCubit extends Cubit<DepositsState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  DepositsCubit(this._firestoreRemoteDataSource) : super(const DepositsState());

  void init() {
    _firestoreRemoteDataSource.getUsers().then((value) => emit(state.copyWith(users: value)));
    _firestoreRemoteDataSource.getDeposits().then((value) => emit(state.copyWith(deposits: value)));
    _firestoreRemoteDataSource.getAccounts().then((value) => emit(state.copyWith(accounts: value)));
  }

  void skip(int months) {
    final acc = state.accounts.where((element) => element.id == '7327123456789').first;
    for (var deposit in state.deposits) {
      final month = months > deposit.termRemains ? deposit.termRemains : months;
      final closed = months > deposit.termRemains ? true : false;
      final account1 = state.accounts.where((element) => element.id == deposit.accountId).first;
      final account2 = state.accounts.where((element) => element.id == deposit.accountId2).first;
      if (!deposit.isClosed) {
        account2.sum += account1.sum * deposit.percent / 100 * month;
        _firestoreRemoteDataSource.saveAccount(account2);
        if (closed) {
          acc.sum -= account1.sum;
          account1.sum += account2.sum;
          _firestoreRemoteDataSource.saveAccount(account1);
          account2.sum = 0;
          _firestoreRemoteDataSource.saveAccount(account2);
        }
        _firestoreRemoteDataSource.saveAccount(acc);
      }
      deposit.termRemains -= month;
      deposit.isClosed = closed;
      _firestoreRemoteDataSource.saveDeposit(deposit);
    }
    init();
  }
}
