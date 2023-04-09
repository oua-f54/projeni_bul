import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/views/splash/splash_view.dart';

import '../../../app/app_base_view_model.dart';

abstract class SplashViewModel extends BaseViewModel<SplashView>{

  @override
  void initState() {
    super.initState();
    splashApp();
  }

  void splashApp() async{
    //TODO Siglation
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    Future.delayed(const Duration(seconds: 2), ()=> {
      if(user == null){
        context.router.replace(const OnboardRoute())
      }
      else{
        context.router.replace(const HomeRoute())
      }
    });
  }
  
}