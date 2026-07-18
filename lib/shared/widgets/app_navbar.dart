import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          const Text(
            'Ercan Ant',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          TextButton(onPressed: () {}, child: const Text('Ana Sayfa')),

          const SizedBox(width: 12),

          TextButton(onPressed: () {}, child: const Text('Kitaplar')),

          const SizedBox(width: 12),

          TextButton(onPressed: () {}, child: const Text('Yazarın Defteri')),

          const SizedBox(width: 12),

          TextButton(onPressed: () {}, child: const Text('Yazar')),

          const SizedBox(width: 12),

          FilledButton(onPressed: () {}, child: const Text('İletişim')),
        ],
      ),
    );
  }
}
