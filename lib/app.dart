import 'package:flutter/material.dart';
import 'package:inforcom/core/app_layout/app_layout.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        bottomNavigationBar: SafeArea(top: false, child: AppLayout()),
      ),
    );
  }
}
