import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';

abstract class FirestoreRemoteDataSource {
Future<List<City>> getCities();
Future<List<Citizenship>> getCitizenships();
Future<List<Marriage>> getMarriages();
Future<List<Disability>> getDisabilities();

Future<List<User>> getUsers();

Future<void> delete(User user);

Future<void> saveUser(User user);
}