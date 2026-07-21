import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/home/domain/book.dart';

class BookDetailDialog extends StatelessWidget {
  const BookDetailDialog({
    super.key,
    required this.book,
    required this.onBuyPressed,
  });

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;

            return isMobile
                ? _MobileLayout(book: book, onBuyPressed: onBuyPressed)
                : _DesktopLayout(book: book, onBuyPressed: onBuyPressed);
          },
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.book, required this.onBuyPressed});

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(book.coverPath, fit: BoxFit.cover),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.lg),
                Text('Arka Kapak', style: textTheme.titleLarge),
                const SizedBox(height: AppSpacing.md),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      book.longDescription,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kapat'),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    FilledButton.icon(
                      onPressed: onBuyPressed,
                      icon: const Icon(Icons.shopping_bag_outlined),
                      label: const Text('Satın Al'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.book, required this.onBuyPressed});

  final Book book;
  final VoidCallback onBuyPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Image.asset(book.coverPath, fit: BoxFit.cover),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(book.title, style: textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.lg),
            Text('Arka Kapak', style: textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            Text(book.longDescription, style: textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onBuyPressed,
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Satın Al'),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kapat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
