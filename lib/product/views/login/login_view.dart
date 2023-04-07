import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/login/login_view_provider.dart';
import 'package:jam_architecture/product/widgets/login_button.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final passwordVisiblity = ref.watch(loginViewProvider).passwordVisible;

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.23),
              child: Image.asset(ImageConstants.logo.toPath)),
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
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: ProjectColors.primaryColor),
                    label: const Text("Password"),
                    suffixIcon: TextButton(onPressed: (){
                      ref.read(loginViewProvider).changePasswordVisiblity();
                    }, child: Icon(passwordVisiblity? Icons.visibility : Icons.visibility_off))
                  ),
                  obscureText: passwordVisiblity,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ],
            ),
          ),
          const LoginButon()
        ],
      ),
    ));
  }
}
