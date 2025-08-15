import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEffect extends StatelessWidget {
  const GlassEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0, // Интенсивность размытия по горизонтали
            sigmaY: 5.0, // Интенсивность размытия по вертикали
          ),
          child: Container(
            color: Colors.white.withAlpha(20), // Прозрачность эффекта
          ),
        ),
      ),
    );
  }
}
