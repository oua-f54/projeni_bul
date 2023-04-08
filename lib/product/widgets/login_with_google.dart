import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../constants/color_constants.dart';
import '../constants/image_constants_enum.dart';
import '../constants/text_constants.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.onlyTopPaddingMedium,
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: context.onlyLeftPaddingNormal,
          decoration: BoxDecoration(border: Border.all(color: ColorConstants.whiteGrey, width: 2.5), color: Colors.white),
          width: context.dynamicWidth(0.85), height: context.dynamicHeight(0.065),
          child: Row(
            children:[
              Image.asset(
                ImageConstants.googleIcon.toPath,
                fit:BoxFit.cover
              ),
              Text(TextConstants.loginWithGoogle, style: context.textTheme.titleLarge,),
            ],
          ),
        ),
      ),
    );
  }
}