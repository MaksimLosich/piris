import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/deposit.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/account/account_state.dart';
import 'package:piris1/presentation/pages/details/details_state.dart';
import 'package:piris1/presentation/pages/edit/edit_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  AccountCubit(this._firestoreRemoteDataSource) : super(const AccountState(account: null));

  void getAcc() async {
    late Account a;
    await _firestoreRemoteDataSource.getAccounts().then(
          (list) => a = list.where((element) => element.id == '7327123456789').first,
        );

    emit(state.copyWith(account: a));
  }
}
