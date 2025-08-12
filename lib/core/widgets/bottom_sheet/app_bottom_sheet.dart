import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';

class AppBottomSheet {
  static Future<void> show(
    BuildContext context, {
    bool isKeyboardOnTop = false,
    bool useRootNavigator = true,
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      // Для отображения BottomSheet поверх панели навигации
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      backgroundColor: AppColors.primary,
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
        return Padding(
          padding: isKeyboardOnTop
              // Для отображения клавиатуры поверх BottomSheet
              ? EdgeInsetsGeometry.zero
              // Сдвигает BottomSheet на высоту клавиатуры
              : EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
          child: SizedBox(
            height: screenHeight * 0.7,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SvgPicture.asset(AppIcons.dragHandle),
                  ),
                  Expanded(child: child),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
