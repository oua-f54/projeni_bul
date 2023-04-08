import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/models/user_model.dart';

class UserRepository extends StateNotifier{
  
  late final FirebaseFirestore _fireStore;
  late final FirebaseAuth _auth;

  UserRepository(FirebaseFirestore firebaseFirestore, FirebaseAuth firebaseAuth) : super(null){
    _fireStore = firebaseFirestore;
    _auth = firebaseAuth;
  }

  Future<void> createUser(UserModel userModel) async{
    await _auth.createUserWithEmailAndPassword(email: userModel.email, password: userModel.password).whenComplete(() => 
      _fireStore.collection("Users").add(userModel.toJson())
    ).catchError((onError,a)=>print(onError));
  }

}

final fbNotifer = StateNotifierProvider((ref) => 
  UserRepository(FirebaseFirestore.instance, FirebaseAuth.instance)
);