import 'package:flutter/material.dart';

import '../../../../../app/theme/app_radius.dart';
import '../../../../../app/theme/app_shadows.dart';

class HeroBook extends StatelessWidget {
  const HeroBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: AppShadows.large,
        ),
        // Şimdilik placeholder gösteriyoruz.
        // Gerçek kitap kapağı eklendiğinde bu içerik Image.asset ile değiştirilecek.
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_stories_rounded, size: 90),

            SizedBox(height: 20),

            Text(
              'Yakında',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text('Kitap kapağı burada yer alacak.'),
          ],
        ),
      ),
    );
  }
}
