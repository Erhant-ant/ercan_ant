import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';
import 'hero_book.dart';
import 'hero_content.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
