import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: .82),
            border: Border(bottom: BorderSide(color: AppColors.border)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .04),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.go('/'),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "ERCAN ANT",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      letterSpacing: 3,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              const _NavItem(label: "Ana Sayfa", route: '/'),
              const SizedBox(width: 8),

              const _NavItem(label: "Kitaplar", route: '/kitaplar'),
              const SizedBox(width: 8),

              const _NavItem(label: "Yazarın Defteri", route: '/blog'),
              const SizedBox(width: 8),

              const _NavItem(label: "Hakkında", route: '/hakkinda'),

              const SizedBox(width: 30),

              FilledButton(
                style: FilledButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => context.go('/iletisim'),
                child: const Text("İletişim"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.label, required this.route});

  final String label;
  final String route;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: hover
                ? AppColors.primary.withValues(alpha: .06)
                : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: hover ? FontWeight.w700 : FontWeight.w500,
                  color: hover ? AppColors.primary : AppColors.textSecondary,
                ),
                child: Text(widget.label),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: hover ? 28 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
