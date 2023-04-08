import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/models/user_model.dart';

class UserRepository extends StateNotifier{
  
  late final FirebaseFirestore _db;

  UserRepository(FirebaseFirestore firebaseFirestore) : super(null){
    _db = firebaseFirestore;
  }

  void createUser(UserModel userModel){
    _db.collection("Users").add(userModel.toJson());
  }

}