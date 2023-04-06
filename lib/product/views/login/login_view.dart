import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/widgets/login_button.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.isKeyBoardOpen? 0 : context.dynamicHeight(0.2),
              child: Image.asset(ImageConstants.logo.toPath)
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: [
                  TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: ProjectColors.primaryColor),
                  label: const Text("Email"),
                ),
                ),
                const SizedBox(height: 20,),
                TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: ProjectColors.primaryColor),
                  label: const Text("Password"),
                )
              ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: const LoginButon()
            )
          ],
        ),
      )
    );
  }
}
