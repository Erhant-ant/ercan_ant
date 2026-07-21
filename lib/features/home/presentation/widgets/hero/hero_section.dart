import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_book.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 1000 px altını tablet/mobil görünüm olarak ele alıyoruz.
        final isMobile = constraints.maxWidth < 1000;

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFCFBF8), Color(0xFFFFFFFF), Color(0xFFF7F3EC)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxxl,
              vertical: 80,
            ),
            child: isMobile
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroBook(),
                      SizedBox(height: AppSpacing.xxxl),
                      HeroContent(),
                    ],
                  )
                : const Row(
                    children: [
                      Expanded(flex: 6, child: HeroContent()),
                      SizedBox(width: AppSpacing.xxl),
                      Expanded(flex: 4, child: HeroBook()),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
