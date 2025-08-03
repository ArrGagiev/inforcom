import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/features/main/main_page.dart';
import 'package:inforcom/features/map/map_page.dart';
import 'package:inforcom/features/profile/profile_page.dart';
import 'package:inforcom/features/promo/promo_page.dart';
import 'package:inforcom/features/support/support_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;

  final EdgeInsets padding = const EdgeInsets.only(
    top: 12,
    bottom: 16,
    left: 22,
    right: 22,
  );

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      // navBarHeight: 80,
      onTabChanged: (tab) => setState(() => currentTab = tab),
      tabs: _buildTabsForAuthUser(context),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          padding: padding,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.dropShadow15.withAlpha(40),
              blurRadius: 7,
              offset: const Offset(0, -3),
            ),
          ],
        ),
      ),
    );
  }

  List<PersistentTabConfig> _buildTabsForAuthUser(BuildContext context) {
    return [
      _buildTab(
        context: context,
        activeIconPath: AppIcons.mainActive,
        inactiveIconPath: AppIcons.mainInactive,
        screen: const MainPage(),
        title: "Галавная",
        index: 0,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.mapActive,
        inactiveIconPath: AppIcons.mapInactive,
        screen: const MapPage(),
        title: "Карта",
        index: 1,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.promoActive,
        inactiveIconPath: AppIcons.promoInactive,
        screen: const PromoPage(),
        title: "Акции",
        index: 2,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.supportActive,
        inactiveIconPath: AppIcons.supportInactive,
        screen: const SupportPage(),
        title: "Поддержка",
        index: 3,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.profileActive,
        inactiveIconPath: AppIcons.profileInactive,
        screen: const ProfilePage(),
        title: "Профиль",
        index: 4,
      ),
    ];
  }

  PersistentTabConfig _buildTab({
    required BuildContext context,
    required String activeIconPath,
    required String inactiveIconPath,
    required Widget screen,
    required String title,
    required int index,
  }) {
    return PersistentTabConfig(
      screen: screen,
      item: ItemConfig(
        icon: Center(
          child: SizedBox(
            width: 64,
            height: 32,
            child: SvgPicture.asset(
              currentTab == index ? activeIconPath : inactiveIconPath,
            ),
          ),
        ),
        activeForegroundColor: AppColors.accent,
        inactiveForegroundColor: AppColors.iconsBase,
        inactiveBackgroundColor: AppColors.iconsBase,
        title: title,
        // textStyle: const TextStyle(height: 4),
      ),
    );
  }
}
