import 'package:flutter/material.dart';
import 'package:inforcom/core/routing/app_router.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  final bool isAuth = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.primary),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
