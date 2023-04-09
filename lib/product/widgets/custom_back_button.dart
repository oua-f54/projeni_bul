import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
      onPressed: () {
        context.pop();
      } ,
    );
  }
}
