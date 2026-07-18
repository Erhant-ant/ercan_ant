import 'package:flutter/material.dart';

import '../../../../../app/theme/app_radius.dart';
import '../../../../../app/theme/app_shadows.dart';

class HeroBook extends StatelessWidget {
  const HeroBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: AppShadows.large,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          child: Container(
            width: 300,
            height: 450,
            color: Colors.grey.shade200,
            child: const Center(child: Icon(Icons.menu_book_rounded, size: 80)),
          ),
        ),
      ),
    );
  }
}
