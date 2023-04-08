import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/constants/edgeInsents_constants.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/login/login_view_provider.dart';
import 'package:jam_architecture/product/widgets/primary_elevated_button.dart';
import 'package:jam_architecture/repositories/user_repository.dart';
import 'package:kartal/kartal.dart';

import '../../../models/user_model.dart';
import '../../widgets/login_with_google.dart';

@RoutePage()
class LoginView extends ConsumerWidget {
  LoginView({Key? key}) : super(key: key);
  
  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel(id: "", email: "", name: "", password: "");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final passwordVisiblity = ref.watch(loginViewProvider).passwordVisible;

    return Scaffold(
        body: Container(
      padding: EdgeInsetsConstants.paddingMedium,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.23),
              child: Image.asset(ImageConstants.logo.toPath)
          ),
          Container(
            padding: EdgeInsetsConstants.formGeneralPadding,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: ProjectColors.primaryColor),
                      label: const Text("Email"),
                    ),
                    onSaved: (value){
                      user.email = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                    onSaved: (value){
                      user.password = value;
                    },
                  ),
                ],
              ),
            ),
          ),
          PrimaryElevatedButton(
            isLoading: false,
            text: "Giriş Yap", onPressed: (){
              formKey.currentState!.save();
              ref.read(userRepositoryNotifer).login(user).whenComplete(() => 
                context.replaceRoute(const HomeRoute()
              ).catchError((error,c){
                print(error);
              }
            )
          );
          }),
          Container(
            padding: context.onlyTopPaddingLow,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hesabın yok mu ?"),
                TextButton(child: const Text("HESAP OLUŞTUR!"),onPressed: (){
                  context.replaceRoute(const SignUpRoute());
                }),
              ],
            )
          ),
          const LoginWithGoogle()
        ],
      ),
    ));
  }
}


