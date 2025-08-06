import 'package:flutter/material.dart';
import 'package:inforcom/core/app_layout/app_nav_bar_config.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'app_nav_bar_style.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarOverlap: NavBarOverlap.custom(overlap: 30),
      backgroundColor: AppColors.primary,
      onTabChanged: (tab) => setState(() => currentTab = tab),
      tabs: AppNavBarConfig.getTabs(context, currentTab),
      navBarBuilder: AppBottomNavStyle.buildNavBar,
    );
  }
}
