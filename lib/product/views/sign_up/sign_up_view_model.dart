import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpViewProvider extends ChangeNotifier{
    
  bool firstPasswordVisible = true;
  bool secondPasswordVisible = true;

  void changeFirstPasswordVisiblity(){
    firstPasswordVisible = !firstPasswordVisible;
    notifyListeners();
  }

  void changeSecondPasswordVisiblity(){
    secondPasswordVisible = !secondPasswordVisible;
    notifyListeners();
  }

}

final signUpViewProvider = ChangeNotifierProvider((ref) => SignUpViewProvider());