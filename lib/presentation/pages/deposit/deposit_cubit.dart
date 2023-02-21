import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/domain/entities/deposit.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/deposit/deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  DepositCubit(this._firestoreRemoteDataSource) : super(const DepositState());

  final termController = TextEditingController();
  final sumController = TextEditingController();
  final percentController = TextEditingController();

  static final RegExp doubleRegExp = RegExp(r'^[\d]+\.[\d]+$');
  static final RegExp numberRegExp = RegExp(r'^[\d]+$');

  void init() {
    _firestoreRemoteDataSource.getUsers().then((value) => emit(state.copyWith(users: value)));
  }

  void setRevokable(bool val) {
    emit(state.copyWith(revokable: val));
  }

  void setCurrency(int? val) {
    if (val != null) {
      emit(state.copyWith(currency: val));
    }
  }

  void setUser(User? user) {
    if (user != null) {
      emit(state.copyWith(user: user));
    }
  }

  void createOrSave() {
    if (validate()) {
      final account1 = Account(
        sum: double.parse(sumController.text),
        id: '3014${getRandomString(9)}',
        userId: state.user!.id,
      );
      final account2 = Account(
        sum: 0,
        id: '3014${getRandomString(9)}',
        userId: state.user!.id,
      );
      final deposit = Deposit(
        revokable: state.revokable,
        term: int.parse(termController.text),
        termRemains: int.parse(termController.text),
        number: getRandomString(13),
        currency: state.currency,
        start: DateTime.now(),
        end: DateTime(
          DateTime
              .now()
              .year,
          DateTime
              .now()
              .month,
          DateTime
              .now()
              .day + int.parse(termController.text),
        ),
        summ: double.parse(sumController.text),
        percent: double.parse(percentController.text),
        userId: state.user!.id,
        accountId: account1.id,
        accountId2: account2.id,
        isClosed: false,
      );
      _firestoreRemoteDataSource.saveAccount(account1);
      _firestoreRemoteDataSource.saveAccount(account2);
      _firestoreRemoteDataSource.saveDeposit(deposit);
      _firestoreRemoteDataSource.getAccounts().then((value) {
        final acc = value
            .where((element) => element.id == '7327123456789')
            .first;
        acc.sum += account1.sum;
        _firestoreRemoteDataSource.saveAccount(acc);
      });
  }
  }

  static const _chars = '1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) =>
      String.fromCharCodes(
        Iterable.generate(
          length,
              (_) =>
              _chars.codeUnitAt(
                _rnd.nextInt(_chars.length),
              ),
        ),
      );

  bool validate() {
    try {
      if (!doubleRegExp.hasMatch(sumController.text)) {
        throw Exception(
          'Поле Суммы должно быть дробным числом',
        );
      }
      if (!numberRegExp.hasMatch(termController.text)) {
        throw Exception(
          'Поле Длительность должно быть натуральным числом',
        );
      }
      if (state.user == null) {
        throw Exception('Выберите пользователя');
      }
      return true;
    } on Exception catch (e) {
      _showToast(e.toString());
      return false;
    }
  }

  _showToast(String title) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
