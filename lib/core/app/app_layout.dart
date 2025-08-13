import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inforcom/core/app/navigation_bar/nav_bar_config.dart';
import 'package:inforcom/core/app/navigation_bar/nav_bar_style.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class AppLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: SafeArea(
        top: false,
        child: PersistentTabView.router(
          navBarOverlap: NavBarOverlap.custom(overlap: 30),
          backgroundColor: AppColors.primary,
          onTabChanged: (tab) {
            // addPostFrameCallback - чтобы отложить вызов после build
            // и скрины успели подгрузиться.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigationShell.goBranch(tab);
            });
          },
          tabs: AppNavBarConfig.getRouterTabs(
            context,
            navigationShell.currentIndex,
          ),
          navBarBuilder: NavBarStyle.buildNavBar,
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
