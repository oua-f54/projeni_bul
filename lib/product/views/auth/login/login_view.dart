
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/constants/edgeInsents_constants.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/auth/login/login_view_provider.dart';
import 'package:jam_architecture/product/widgets/primary_elevated_button.dart';
import 'package:jam_architecture/repositories/project_repository.dart';
import 'package:jam_architecture/repositories/user_repository.dart';
import 'package:kartal/kartal.dart';

import '../../../widgets/login_with_google.dart';

@RoutePage()
class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(loginViewProvider);
    final formKey = provider.formKey;
    final user = provider.user;
    final isLoading = provider.isLoading;
    final passwordVisiblity = provider.passwordVisible;

    return Scaffold(
        body: Container(
      padding: EdgeInsetsConstants.paddingMedium,
      alignment: Alignment.center,
      child: SingleChildScrollView(
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
                      textInputAction: TextInputAction.next,
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
                          ref.read(loginViewProvider).changePasswordVisiblity();
                        }, child: Icon(passwordVisiblity? Icons.visibility : Icons.visibility_off))
                      ),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                          if (value.isNullOrEmpty) {
                            return "Bu alan boş bırakılamaz";
                          }
                          return null;
                        },
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
              isLoading: isLoading,
              text: "Giriş Yap", onPressed: () async{
                if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    ref.read(loginViewProvider).changeLoading();
                    try{
                      await ref.read(userRepositoryNotifer).login(user);
                      await ref.read(userRepositoryNotifer).getCurrentUser();
                      await ref.read(projectRepositoryNotifer).getOwnProjects();
                    }catch(e){
                      ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                      ref.read(loginViewProvider).changeLoading();
                      return;
                    }
                    ref.read(loginViewProvider).changeLoading();
                    context.replaceRoute(const HomeRoute());
                }
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
      ),
    ));
  }
}


