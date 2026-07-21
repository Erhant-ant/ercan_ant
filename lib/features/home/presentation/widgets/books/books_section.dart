import 'package:flutter/material.dart';

import 'package:ercan_ant/features/home/data/book_repository.dart';

import 'book_card.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final books = const BookRepository().getBooks();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kitaplar', style: Theme.of(context).textTheme.displaySmall),

          const SizedBox(height: 12),

          SizedBox(
            width: 700,
            child: Text(
              'Yayınlanan ve hazırlık aşamasında olan eserleri buradan inceleyebilir, satın alınabildiği platformlara ulaşabilirsiniz.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          const SizedBox(height: 48),

          Wrap(
            spacing: 40,
            runSpacing: 48,
            children: books.map((book) => BookCard(book: book)).toList(),
          ),
        ],
      ),
    );
  }
}
