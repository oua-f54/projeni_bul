import 'package:flutter/material.dart';

abstract class BaseViewModel<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }
}