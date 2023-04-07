import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import "package:kartal/kartal.dart";

class LoginButon extends StatelessWidget {
  const LoginButon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.replaceRoute(const HomeRoute());
    }, 
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      )
    ),
    child: Text("Log In",
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: ProjectColors.canvasColor
      ),
    )
    );
  }
}
