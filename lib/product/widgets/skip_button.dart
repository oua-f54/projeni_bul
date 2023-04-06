import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/text_constants.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(TextConstants.skipButtonText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConstants.darkGrey)));
  }
}