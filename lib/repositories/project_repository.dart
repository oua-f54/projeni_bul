

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../models/project.dart';

class ProjectRepository extends ChangeNotifier{
  
  late final FirebaseFirestore fireStore;
  late final FirebaseAuth auth;

  ProjectRepository(FirebaseFirestore firebaseFirestore, FirebaseAuth firebaseAuth){
    fireStore = firebaseFirestore;
    auth = firebaseAuth;
    getAllProjects();
    getOwnProjects();
  }

  List<Project> projectList = [];
  List<Project> ownProjectList = [];

  Future<void> getAllProjects() async{
    var snapshot = await fireStore.collection("Projects").get();
    projectList = snapshot.docs.map((e)=> Project.fromJson(e.data())).toList();
    notifyListeners();
  }

  Future<void> getOwnProjects() async{
    var snapshot = await fireStore.collection("Projects").where("author", isEqualTo: auth.currentUser!.uid).get();
    
    ownProjectList = snapshot.docs.map((e)=> Project.fromJson(e.data())).toList();
    notifyListeners();
  }

  Future addProject(Project project) async{
    project.author = auth.currentUser!.uid;
    if(project.skill.isNullOrEmpty){
      throw "Yetenek seçiniz";
    }
    await fireStore.collection("Projects").add(project.toJson());
  }

}

final projectRepositoryNotifer = ChangeNotifierProvider((ref) => 
  ProjectRepository(FirebaseFirestore.instance, FirebaseAuth.instance)
);