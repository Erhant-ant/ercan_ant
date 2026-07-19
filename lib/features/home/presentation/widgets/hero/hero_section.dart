import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_book.dart';
import 'package:ercan_ant/features/home/presentation/widgets/hero/hero_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFCFBF8), Color(0xFFFFFFFF), Color(0xFFF7F3EC)],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            // İçeriğin kenarlara yapışmaması için ortak spacing kullanıyoruz.
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxxl,
              vertical: AppSpacing.giant,
            ),
            child: Row(
              children: const [
                Expanded(flex: 6, child: HeroContent()),
                SizedBox(width: AppSpacing.xxl),
                Expanded(flex: 4, child: HeroBook()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
