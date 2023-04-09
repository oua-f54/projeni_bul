
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/views/auth/sign_up/sign_up_view_provider.dart';
import 'package:kartal/kartal.dart';

import '../../../../app/app_router.dart';
import '../../../../repositories/user_repository.dart';
import '../../../constants/edgeInsents_constants.dart';
import '../../../constants/image_constants_enum.dart';
import '../../../constants/project_colors.dart';
import '../../../widgets/primary_elevated_button.dart';
import '../../../widgets/login_with_google.dart';

@RoutePage()
class SignUpView extends ConsumerWidget{
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(signUpViewProvider);
    final formKey = provider.formKey;
    final user = provider.user;
    final isLoading = provider.isLoading;
    final fistPasswordVisiblity = provider.passwordVisible;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: context.paddingNormal,
              alignment: Alignment.center,
              child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 70,),
            SizedBox(
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.18),
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
                      validator: (value) {
                        if (value.isNullOrEmpty) {
                          return "Bu alan boş bırakılamaz";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: ProjectColors.primaryColor),
                        label: const Text("Email"),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value){
                        user.email = value;
                      },
                      validator: (value) {
                        if (value.isNullOrEmpty) {
                          return "Bu alan boş bırakılamaz";
                        }
                        if (!value.isValidEmail) {
                          return "Lütfen doğru bir email giriniz.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: ProjectColors.primaryColor),
                        label: const Text("Şifre"),
                        suffixIcon: TextButton(onPressed: (){
                          ref.read(signUpViewProvider).changePasswordVisiblity();
                        }, child: Icon(fistPasswordVisiblity? Icons.visibility : Icons.visibility_off))
                      ),
                      onSaved: (value){
                        user.password = value;
                      },
                      validator: (value) {
                        if (value.isNullOrEmpty) {
                          return "Bu alan boş bırakılamaz";
                        }
                        return null;
                      },
                      obscureText: fistPasswordVisiblity,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 20),

                    //TODO Password Checker
                    /* TextFormField(
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
                    ), */

                  ],
                ),
              ),
            ),
            PrimaryElevatedButton(
              isLoading: isLoading,
              text: "Kayıt Ol", 
              onPressed: () async{
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  ref.read(signUpViewProvider).changeLoading();
                  inspect(user);
                  try{
                    await ref.read(userRepositoryNotifer).createUser(user);
                  }catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    ref.read(signUpViewProvider).changeLoading();
                    return;
                  }
                  context.replaceRoute(LoginRoute());
                }
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
