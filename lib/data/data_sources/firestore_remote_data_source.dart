import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Disability>> getDisabilities() async {
    final snapshots = await _firestore.collection('disabilities').get();
    return snapshots.docs
        .map((doc) => Disability.fromJson(doc.data()..addAll({'id': doc.id})))
        .toList();
  }

  @override
  Future<List<User>> getUsers() async {
    final snapshots = await _firestore.collection('users').get();
    return snapshots.docs.map((doc) => User.fromJson(doc.data()..addAll({'id': doc.id}))).toList();
  }

  @override
  Future<List<City>> getCities() async {
    final snapshots = await _firestore.collection('cities').get();
    return snapshots.docs.map((doc) => City.fromJson(doc.data()..addAll({'id': doc.id}))).toList();
  }

  @override
  Future<List<Citizenship>> getCitizenships() async {
    final snapshots = await _firestore.collection('citizenships').get();
    return snapshots.docs
        .map((doc) => Citizenship.fromJson(doc.data()..addAll({'id': doc.id})))
        .toList();
  }

  @override
  Future<List<Marriage>> getMarriages() async {
    final snapshots = await _firestore.collection('marriage').get();
    return snapshots.docs
        .map((doc) => Marriage.fromJson(doc.data()..addAll({'id': doc.id})))
        .toList();
  }

  @override
  Future<void> saveUser(User user) async {
    final json = user.toJson();
    json.remove('id');
    final found = await _firestore
        .collection('users')
        .where('passportIdNumber', isEqualTo: user.passportIdNumber)
        .get();
    final found1 = await _firestore
        .collection('users')
        .where('passportSeries', isEqualTo: user.passportSeries)
        .where('passportNumber', isEqualTo: user.passportNumber)
        .get();
    if (user.id.isEmpty) {
      if (found.docs.isEmpty && found1.docs.isEmpty) {
        _firestore.collection('users').add(user.toJson());
      } else {
        Fluttertoast.showToast(
          msg: 'Пользователь с таким паспортом существует',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } else {
      if (found.docs.length == 1 &&
          found.docs.first.id == user.id &&
          found1.docs.length == 1 &&
          found1.docs.first.id == user.id) {
        _firestore.collection('users').doc(user.id).update(json);
      } else {
        Fluttertoast.showToast(
          msg: 'Пользователь с таким паспортом существует',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Future<void> delete(User user) async {
    _firestore.collection('users').doc(user.id).delete();
  }
}
