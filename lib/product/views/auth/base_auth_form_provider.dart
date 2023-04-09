import 'package:flutter/material.dart';

import '../../../app/app_base_view_provider.dart';
import '../../../models/user_model.dart';

class BaseAuthFormChangeNotifier extends BaseChangeNotifier{
  UserModel user = UserModel(id: "", email: "", name: "", password: "");

  final formKey = GlobalKey<FormState>();

  bool passwordVisible = true;

  void changePasswordVisiblity(){
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}