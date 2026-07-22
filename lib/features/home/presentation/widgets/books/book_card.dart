import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_shadows.dart';
import 'package:ercan_ant/features/home/domain/book.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/book_detail_dialog.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/purchase_dialog.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: SizedBox(
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: _isHovered ? AppShadows.large : AppShadows.medium,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 3,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 220),
                          scale: _isHovered ? 1.03 : 1,
                          child: Image.asset(book.coverPath, fit: BoxFit.cover),
                        ),
                      ),

                      if (!book.isPublished)
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              'Yakında',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(book.title, style: Theme.of(context).textTheme.titleLarge),

              const SizedBox(height: 8),

              Text(
                book.description,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => BookDetailDialog(
                          book: book,
                          onBuyPressed: () {
                            Navigator.pop(context);

                            showDialog(
                              context: context,
                              builder: (_) => PurchaseDialog(book: book),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('Detay'),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: FilledButton(
                      onPressed: book.isPublished
                          ? () {
                              showDialog(
                                context: context,
                                builder: (_) => PurchaseDialog(book: book),
                              );
                            }
                          : null,
                      child: const Text('Satın Al'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
