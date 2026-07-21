import 'package:flutter/material.dart';

import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/features/home/domain/book.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/book_detail_dialog.dart';
import 'package:ercan_ant/features/home/presentation/dialogs/purchase_dialog.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.asset(book.coverPath, fit: BoxFit.cover),
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
    );
  }
}
