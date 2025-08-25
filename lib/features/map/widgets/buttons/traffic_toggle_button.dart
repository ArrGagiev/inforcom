import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';

class TrafficToggleButton extends StatefulWidget {
  final VoidCallback? onPressed;

  const TrafficToggleButton({super.key, this.onPressed});

  @override
  State<TrafficToggleButton> createState() => _TrafficToggleButtonState();
}

class _TrafficToggleButtonState extends State<TrafficToggleButton> {
  bool _isActive = false;

  void _handleTap() {
    setState(() {
      _isActive = !_isActive;
    });
    widget.onPressed?.call(); // Вызываем внешний onPressed
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _handleTap,
      icon: Image.asset(
        _isActive ? AppIcons.trafficOn : AppIcons.trafficOff,
        width: 24,
      ),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(64, 44),
        maximumSize: const Size(64, 44),
        fixedSize: const Size(64, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64),
          side: const BorderSide(color: AppColors.lightGray),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
