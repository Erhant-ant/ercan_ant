import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_shadows.dart';

class HeroBook extends StatelessWidget {
  const HeroBook({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Kitabın arkasındaki yumuşak ışık.
            Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary.withValues(alpha: .08),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width: 320,
              height: 470,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                boxShadow: AppShadows.large,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.xl),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [primary, const Color(0xFF2D4059)],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 24,
                              left: 24,
                              child: Text(
                                'ERCAN ANT',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      color: Colors.white70,
                                      letterSpacing: 2,
                                    ),
                              ),
                            ),

                            const Center(
                              child: Icon(
                                Icons.auto_stories_rounded,
                                size: 120,
                                color: Colors.white,
                              ),
                            ),

                            Positioned(
                              bottom: 30,
                              left: 24,
                              right: 24,
                              child: Text(
                                'YENİ KİTAP',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Çok Yakında',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Yeni roman yakında okuyucularıyla buluşacak.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            const SizedBox(height: 20),

                            FilledButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.menu_book_outlined),
                              label: const Text('Detayları Gör'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
