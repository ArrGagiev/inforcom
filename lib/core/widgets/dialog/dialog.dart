import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';

class AppDialog {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required Widget child,
    double widthPercent = 0.7,
  }) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: AppColors.primary,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * widthPercent,
          child: child,
        ),
      ),
    );
  }
}
