import 'package:flutter/material.dart';
import 'package:inforcom/core/app_layout/app_layout.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/features/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  final bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          top: false,
          child: isAuth ? AppLayout() : SplashScreen(),
        ),
      ),
    );
  }
}
