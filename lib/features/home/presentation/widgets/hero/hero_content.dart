import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_spacing.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ERCAN ANT', style: Theme.of(context).textTheme.labelLarge),

            const SizedBox(height: AppSpacing.md),

            Text(
              'Kelimelerin\nbıraktığı izleri\nkeşfedin.',
              style: Theme.of(context).textTheme.displayLarge,
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              'Romanlar, hikâyeler ve denemeler... Her eser, okuyucusunu yeni bir yolculuğa davet eder.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: AppSpacing.xxl),

            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('Kitapları İncele'),
                ),

                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Yazarın Defteri'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
