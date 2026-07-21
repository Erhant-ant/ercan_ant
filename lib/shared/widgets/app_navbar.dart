import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_spacing.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,

      // Navbar'ı içerikten ayıran ince çizgi.
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
      ),

      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),

      child: Row(
        children: [
          Text('Ercan Ant', style: Theme.of(context).textTheme.headlineMedium),

          const Spacer(),

          TextButton(onPressed: () {}, child: const Text('Ana Sayfa')),

          const SizedBox(width: AppSpacing.md),

          TextButton(onPressed: () {}, child: const Text('Kitaplar')),

          const SizedBox(width: AppSpacing.md),

          TextButton(onPressed: () {}, child: const Text('Yazarın Defteri')),

          const SizedBox(width: AppSpacing.md),

          TextButton(onPressed: () {}, child: const Text('Yazar')),

          const SizedBox(width: AppSpacing.lg),

          FilledButton(onPressed: () {}, child: const Text('İletişim')),
        ],
      ),
    );
  }
}
