import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/features/main/main_page.dart';
import 'package:inforcom/features/map/map_page.dart';
import 'package:inforcom/features/profile/profile_page.dart';
import 'package:inforcom/features/promo/promo_page.dart';
import 'package:inforcom/features/support/support_page.dart';

class AppNavBarConfig {
  static List<PersistentTabConfig> getTabs(
    BuildContext context,
    int currentTab,
  ) {
    return [
      _buildTab(
        context: context,
        activeIconPath: AppIcons.mainActive,
        inactiveIconPath: AppIcons.mainInactive,
        screen: const MainPage(),
        title: "Главная",
        index: 0,
        currentTab: currentTab,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.mapActive,
        inactiveIconPath: AppIcons.mapInactive,
        screen: const MapPage(),
        title: "Карта",
        index: 1,
        currentTab: currentTab,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.promoActive,
        inactiveIconPath: AppIcons.promoInactive,
        screen: const PromoPage(),
        title: "Акции",
        index: 2,
        currentTab: currentTab,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.supportActive,
        inactiveIconPath: AppIcons.supportInactive,
        screen: const SupportPage(),
        title: "Поддержка",
        index: 3,
        currentTab: currentTab,
      ),
      _buildTab(
        context: context,
        activeIconPath: AppIcons.profileActive,
        inactiveIconPath: AppIcons.profileInactive,
        screen: const ProfilePage(),
        title: "Профиль",
        index: 4,
        currentTab: currentTab,
      ),
    ];
  }

  static PersistentTabConfig _buildTab({
    required BuildContext context,
    required String activeIconPath,
    required String inactiveIconPath,
    required Widget screen,
    required String title,
    required int index,
    required int currentTab,
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
        textStyle: AppTextStyles.title4,
      ),
    );
  }
}
