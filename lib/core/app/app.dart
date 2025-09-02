import 'package:flutter/material.dart';
import 'package:inforcom/core/routing/app_router.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key, required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter(isAuthenticated),
    );
  }
}
