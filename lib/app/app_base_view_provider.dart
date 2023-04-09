import 'package:flutter/material.dart';

class BaseChangeNotifier extends ChangeNotifier{
  bool isLoading = false;

    void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
}