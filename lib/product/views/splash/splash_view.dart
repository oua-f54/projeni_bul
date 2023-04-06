import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/views/splash/splash_view_model.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Splash'),
      ),
    );
  }
}