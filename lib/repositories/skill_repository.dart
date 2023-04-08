


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/skill.dart';

class SkillRepository extends ChangeNotifier{
  
  late final FirebaseFirestore fireStore;

  SkillRepository(FirebaseFirestore firebaseFirestore){
    fireStore = firebaseFirestore;
  }

  Future<List<Skill>> getAllSkills() async{
    var snapshot = await fireStore.collection("Skills").get();
    var skills = snapshot.docs.map((e)=> Skill.fromJson(e.data())).toList();
    return skills;
  }
}

final skillRepositoryNotifer = ChangeNotifierProvider((ref) => 
  SkillRepository(FirebaseFirestore.instance)
);