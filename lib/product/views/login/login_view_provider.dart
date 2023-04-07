import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewProvider extends ChangeNotifier{
    
  bool passwordVisible = true;

  void changePasswordVisiblity(){
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

}

final loginViewProvider = ChangeNotifierProvider((ref) => LoginViewProvider());