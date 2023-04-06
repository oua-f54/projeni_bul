import 'package:auto_route/auto_route.dart';
import 'package:jam_architecture/app/app_base_view_model.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/views/splash/splash_view.dart';

abstract class SplashViewModel extends BaseViewModel<SplashView>{
  @override
  void initState() {
    super.initState();
    splashApp();
  }

  void splashApp(){
    Future.delayed(const Duration(seconds: 2), ()=> {
      context.router.replace(const OnboardRoute())
    });
  }
  
}