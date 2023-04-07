import 'package:flutter/material.dart';

class BottomAppBarItems {
  static List<Tab> tabs = [
    Tab(icon: const Icon(Icons.search_sharp), text: TabLabels.explore.name),
    Tab(icon: const Icon(Icons.person), text: TabLabels.profile.name,),
  ];

  
}
enum TabLabels {explore, profile }