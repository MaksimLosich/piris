import 'package:piris1/domain/entities/account.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/deposit.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';

abstract class FirestoreRemoteDataSource {
Future<List<City>> getCities();
Future<List<Citizenship>> getCitizenships();
Future<List<Marriage>> getMarriages();
Future<List<Disability>> getDisabilities();

Future<List<User>> getUsers();
Future<List<Deposit>> getDeposits();
Future<List<Account>> getAccounts();

Future<void> delete(User user);

Future<void> saveUser(User user);
Future<void> saveDeposit(Deposit deposit);
Future<void> saveAccount(Account account);

Future<void> closeDeposit(Deposit deposit);
}