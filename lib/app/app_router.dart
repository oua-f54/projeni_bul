import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../product/views/login/login_view.dart';
import '../product/views/onboard/onboard_view.dart';
import '../product/views/splash/splash_view.dart';
import '../product/views/home/home_view.dart';

part 'app_router.gr.dart'; 

@AutoRouterConfig(replaceInRouteName: "View,Route")      
class AppRouter extends _$AppRouter {      
    
  @override      
  final List<AutoRoute> routes = [      
    AutoRoute(page: SplashRoute.page, path: "/"),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: LoginRoute.page),
  ];
}    