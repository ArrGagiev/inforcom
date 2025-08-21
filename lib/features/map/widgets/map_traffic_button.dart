import 'package:flutter/material.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';

class MapTrafficButton extends StatefulWidget {
  final VoidCallback? onPressed;

  const MapTrafficButton({super.key, this.onPressed});

  @override
  State<MapTrafficButton> createState() => _MapTrafficButtonState();
}

class _MapTrafficButtonState extends State<MapTrafficButton> {
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
