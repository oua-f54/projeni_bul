
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/views/sign_up/sign_up_view_model.dart';
import 'package:jam_architecture/repositories/user_repository.dart';
import 'package:kartal/kartal.dart';

import '../../../app/app_router.dart';
import '../../../models/user_model.dart';
import '../../constants/edgeInsents_constants.dart';
import '../../constants/image_constants_enum.dart';
import '../../constants/project_colors.dart';
import '../../widgets/primary_elevated_button.dart';
import '../../widgets/login_with_google.dart';

@RoutePage()
class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpView();

}
class _SignUpView extends ConsumerState<SignUpView> {

  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel(id: "", email: "", name: "", password: "");

  bool isLoading = false;

  void changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {

    final fistPasswordVisiblity = ref.watch(signUpViewProvider).firstPasswordVisible;
    final secondPasswordVisiblity = ref.watch(signUpViewProvider).secondPasswordVisible;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsetsConstants.paddingMedium,
              alignment: Alignment.center,
              child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.23),
                child: Image.asset(ImageConstants.logo.toPath)
            ),
            context.isKeyBoardOpen? const SizedBox(height: 50): const SizedBox(),
            Container(
              padding: EdgeInsetsConstants.formGeneralPadding,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: ProjectColors.primaryColor),
                        label: const Text("Name"),
                      ),
                      onSaved: (value){
                        user.name = value;
                      },
                    ),
                    const SizedBox(height: 20),
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
                          ref.read(signUpViewProvider).changeFirstPasswordVisiblity();
                        }, child: Icon(fistPasswordVisiblity? Icons.visibility : Icons.visibility_off))
                      ),
                      onSaved: (value){
                        user.password = value;
                      },
                      obscureText: fistPasswordVisiblity,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: ProjectColors.primaryColor),
                        label: const Text("Tekrar Şifre"),
                        suffixIcon: TextButton(onPressed: (){
                          ref.read(signUpViewProvider).changeSecondPasswordVisiblity();
                        }, child: Icon(secondPasswordVisiblity? Icons.visibility : Icons.visibility_off))
                      ),
                      obscureText: secondPasswordVisiblity,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                  ],
                ),
              ),
            ),
            PrimaryElevatedButton(
              isLoading: isLoading,
              text: "Kayıt Ol", onPressed: () async{
              formKey.currentState!.save();
              changeLoading();
              await ref.read(userRepositoryNotifer).createUser(user).whenComplete(() => 
                context.replaceRoute(LoginRoute())
              );
            }),
            Container(
              padding: context.onlyTopPaddingLow,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hesabın var mı ?"),
                  TextButton(child: const Text("OTURUM AÇ!"),onPressed: (){
                    context.replaceRoute(LoginRoute());
                  }),
                ],
              )
            ),
            const LoginWithGoogle()
          ],
              ),
            ),
        ));
  }
}
