import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
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
                    label: const Text("Şifre"),
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
          const LoginButon(),
          Container(
            padding: const EdgeInsets.only(top:5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hesabın yok mu ?"),
                TextButton(child: const Text("HESAP OLUŞTUR!"),onPressed: (){}),
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(border: Border.all(color: ColorConstants.lightGrey, width: 0.5), color: Colors.white),
                 width: 350, height: 50,
                child: Row(
                  children:[
                    Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit:BoxFit.cover
                    ),
                    Text("Log In With Google", style: context.textTheme.titleLarge,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
