import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';

class HeroBackground extends StatelessWidget {
  const HeroBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.gradientStart,
            Colors.white,
            AppColors.gradientEnd,
          ],
        ),
      ),
      child: child,
    );
  }
}
