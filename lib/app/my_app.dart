import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/theme.dart';

import 'app_router.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();   

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeConsts.light,
      darkTheme: ThemeConsts.dark,
      themeMode: ThemeMode.light,
      routerConfig: _appRouter.config(),
    );
  }
}