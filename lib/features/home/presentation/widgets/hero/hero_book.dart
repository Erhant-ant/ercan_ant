import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';

class HeroBook extends StatefulWidget {
  const HeroBook({super.key});

  @override
  State<HeroBook> createState() => _HeroBookState();
}

class _HeroBookState extends State<HeroBook>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _hover = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : 340.0;
        final cardWidth = ((availableWidth - 24) * .9).clamp(216.0, 306.0);
        final imageHeight = cardWidth * 1.5;
        final cardHeight = imageHeight + 210;
        final glowSize = cardWidth + (_hover ? 130 : 80);

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final floating = math.sin(_controller.value * math.pi * 2) * 8;

            return MouseRegion(
              cursor: SystemMouseCursors.precise,
              onEnter: (_) => setState(() => _hover = true),
              onExit: (_) => setState(() => _hover = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(
                  0,
                  floating + (_hover ? -8 : 0),
                  0,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow efekti
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: glowSize,
                      height: glowSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        gradient: RadialGradient(
                          colors: [
                            primary.withValues(alpha: .18),
                            primary.withValues(alpha: .07),
                            Colors.transparent,
                          ],
                          stops: const [.10, .45, 1],
                        ),
                      ),
                    ),

                    // Kitap kartı
                    AnimatedScale(
                      duration: const Duration(milliseconds: 250),
                      scale: _hover ? 1.05 : 1,
                      child: Transform.rotate(
                        angle: _hover ? -.015 : -.035,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: cardWidth,
                          height: cardHeight,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .18),
                                blurRadius: _hover ? 80 : 60,
                                spreadRadius: _hover ? 8 : 2,
                                offset: Offset(0, _hover ? 40 : 30),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: Column(
                              children: [
                                // Üst resim alanı
                                SizedBox(
                                  height: imageHeight,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22),
                                    ),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.asset(
                                          'assets/books/hero_book.jpg',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    primary,
                                                    AppColors.bookCoverDark,
                                                  ],
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    top: 24,
                                                    left: 24,
                                                    child: Text(
                                                      'ERCAN ANT',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge
                                                          ?.copyWith(
                                                            color:
                                                                Colors.white70,
                                                            letterSpacing: 2,
                                                          ),
                                                    ),
                                                  ),
                                                  const Center(
                                                    child: Icon(
                                                      Icons
                                                          .auto_stories_rounded,
                                                      size: 120,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 24,
                                                    right: 24,
                                                    bottom: 30,
                                                    child: Text(
                                                      'İLK ROMAN',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),

                                        // Karartma overlay
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withValues(
                                                  alpha: .28,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Alt bilgi alanı
                                Expanded(
                                  flex: 3,
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Bir Göç ve Aidiyet Hikâyesi',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primary,
                                                fontSize: 18,
                                              ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Ömer\'in bilinmezliğe uzanan tren yolculuğunda, umudun ve acının sessiz yankılarına tanık olun.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                height: 1.5,
                                                color: AppColors.textSecondary,
                                                fontSize: 14,
                                              ),
                                        ),
                                        const SizedBox(height: 20),
                                        FilledButton.icon(
                                          style: FilledButton.styleFrom(
                                            minimumSize: const Size(
                                              double.infinity,
                                              52,
                                            ),
                                            backgroundColor: AppColors.primary,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                          onPressed: () =>
                                              context.go('/kitaplar'),
                                          icon: const Icon(
                                            Icons.menu_book_outlined,
                                          ),
                                          label: const Text('Hikâyeyi Keşfet'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
