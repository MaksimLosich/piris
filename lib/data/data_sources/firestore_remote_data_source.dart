import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';

class _FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


}
