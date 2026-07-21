import 'package:flutter/material.dart';

import '../../../shared/layout/app_layout.dart';
import '../../../shared/widgets/app_navbar.dart';
import 'widgets/books/books_section.dart';
import 'widgets/hero/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayout(
        child: Column(
          children: [
            const AppNavbar(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeroSection(),

                    const SizedBox(height: 120),

                    const BooksSection(),

                    const SizedBox(height: 120),
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
