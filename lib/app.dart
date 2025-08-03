import 'package:flutter/material.dart';
import 'package:inforcom/core/bottom_nav_bar/bottom_nav_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(bottomNavigationBar: BottomNavBar()),
    );
  }
}
