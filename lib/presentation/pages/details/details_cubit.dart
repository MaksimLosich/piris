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
import 'package:piris1/presentation/pages/details/details_state.dart';
import 'package:piris1/presentation/pages/edit/edit_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  DetailsCubit(this._firestoreRemoteDataSource) : super(const DetailsState());

  void closeDeposit(Deposit d, Account account1, Account account2) {
    _firestoreRemoteDataSource.closeDeposit(d);
    account1.sum += account2.sum;
    _firestoreRemoteDataSource.saveAccount(account1);
    account2.sum = 0;
    _firestoreRemoteDataSource.saveAccount(account2);
  }
}
