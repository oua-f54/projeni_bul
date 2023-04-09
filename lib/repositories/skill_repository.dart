import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/skill.dart';

class SkillRepository extends ChangeNotifier{
  
  late final FirebaseFirestore fireStore;

  SkillRepository(FirebaseFirestore firebaseFirestore){
    fireStore = firebaseFirestore;
    getAllSkills();
  }

  List<Skill> skillList = [];

  Future<void> getAllSkills() async{
    var snapshot = await fireStore.collection("Skills").get();
    skillList = snapshot.docs.map((e)=> Skill.fromJson(e.data())).toList();
    notifyListeners();
  }

}

final skillRepositoryNotifer = ChangeNotifierProvider((ref) => 
  SkillRepository(FirebaseFirestore.instance)
);