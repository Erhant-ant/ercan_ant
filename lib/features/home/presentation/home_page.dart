import 'package:flutter/material.dart';

import 'package:ercan_ant/shared/widgets/app_footer.dart';
import 'package:ercan_ant/shared/widgets/app_navbar.dart';

import 'widgets/about/about_teaser.dart';
import 'widgets/blog/blog_teaser.dart';
import 'widgets/books/books_section.dart';
import 'widgets/hero/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppNavbar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeroSection(),

                  const AboutTeaser(),

                  const BooksSection(),

                  const BlogTeaser(),

                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
