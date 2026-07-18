import 'package:flutter/material.dart';

import '../../../../../app/theme/app_spacing.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ERCAN ANT', style: Theme.of(context).textTheme.labelLarge),

        const SizedBox(height: AppSpacing.md),

        Text(
          'Kelimelerin\nbıraktığı izleri\nkeşfedin.',
          style: Theme.of(context).textTheme.displayLarge,
        ),

        const SizedBox(height: AppSpacing.lg),

        SizedBox(
          width: 520,
          child: Text(
            'Romanlar, hikâyeler ve edebi notlar ile kelimelerin dünyasına yolculuk edin.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        const SizedBox(height: AppSpacing.xxl),

        Row(
          children: [
            FilledButton(
              onPressed: () {},
              child: const Text('Kitapları İncele'),
            ),

            const SizedBox(width: AppSpacing.md),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Yazarın Defteri'),
            ),
          ],
        ),
      ],
    );
  }
}
