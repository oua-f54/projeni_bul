
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/models/user_model.dart';

class UserRepository extends ChangeNotifier{
  
  late final FirebaseFirestore fireStore;
  late final FirebaseAuth auth;

  UserRepository(FirebaseFirestore firebaseFirestore, FirebaseAuth firebaseAuth){
    fireStore = firebaseFirestore;
    auth = firebaseAuth;
    getCurrentUser();
  }

  UserModel userModel = UserModel(id: "", name: "", email: "", password: "");

  Future<void> createUser(UserModel userModel) async{
    UserCredential user = await auth.createUserWithEmailAndPassword(email: userModel.email??"", password: userModel.password??"");

    userModel.id = user.user!.uid;
    await  fireStore.collection("Users").add(userModel.toJson());
    
  }

  Future<void> login(UserModel userModel) async{
    UserCredential user = await auth.signInWithEmailAndPassword(email: userModel.email??"", password: userModel.password??"");
  }

  Future<void> getCurrentUser() async{
    if(auth.currentUser != null){
      var response = await fireStore.collection("Users").where("id", isEqualTo: auth.currentUser!.uid).get();
      var data = UserModel.fromJson(response.docs.first.data());
      userModel = data;  
      notifyListeners();
    }
  }

}

final userRepositoryNotifer = ChangeNotifierProvider((ref) => 
  UserRepository(FirebaseFirestore.instance, FirebaseAuth.instance)
);