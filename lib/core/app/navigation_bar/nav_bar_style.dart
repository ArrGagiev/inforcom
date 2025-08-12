import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class NavBarStyle {
  static const padding = EdgeInsets.only(
    top: 12,
    bottom: 16,
    left: 22,
    right: 22,
  );

  static Widget buildNavBar(NavBarConfig config) {
    return Style1BottomNavBar(
      navBarConfig: config,
      navBarDecoration: NavBarDecoration(
        padding: padding,
        border: Border.all(color: AppColors.lightGray),
        // borderRadius: BorderRadius.circular(28),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: AppColors.dropShadow15.withAlpha(40),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
