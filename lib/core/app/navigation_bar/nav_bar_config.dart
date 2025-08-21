import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';

class AppNavBarConfig {
  static List<PersistentRouterTabConfig> getRouterTabs(
    BuildContext context,
    int currentTab,
  ) {
    return [
      _buildRouterTab(
        context: context,
        activeIconPath: AppIcons.mainActive,
        inactiveIconPath: AppIcons.mainInactive,
        title: "Главная",
        index: 0,
        currentTab: currentTab,
      ),
      _buildRouterTab(
        context: context,
        activeIconPath: AppIcons.mapActive,
        inactiveIconPath: AppIcons.mapInactive,
        title: "Карта",
        index: 1,
        currentTab: currentTab,
      ),
      _buildRouterTab(
        context: context,
        activeIconPath: AppIcons.promoActive,
        inactiveIconPath: AppIcons.promoInactive,
        title: "Акции",
        index: 2,
        currentTab: currentTab,
      ),
      _buildRouterTab(
        context: context,
        activeIconPath: AppIcons.supportActive,
        inactiveIconPath: AppIcons.supportInactive,
        title: "Поддержка",
        index: 3,
        currentTab: currentTab,
      ),
      _buildRouterTab(
        context: context,
        activeIconPath: AppIcons.profileActive,
        inactiveIconPath: AppIcons.profileInactive,
        title: "Профиль",
        index: 4,
        currentTab: currentTab,
      ),
    ];
  }

  static PersistentRouterTabConfig _buildRouterTab({
    required BuildContext context,
    required String activeIconPath,
    required String inactiveIconPath,
    required String title,
    required int index,
    required int currentTab,
  }) {
    return PersistentRouterTabConfig(
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
        textStyle: AppTextStyles.caption,
      ),
    );
  }
}
