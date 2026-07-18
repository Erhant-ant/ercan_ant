import 'package:flutter/material.dart';

import '../../../shared/layout/app_layout.dart';
import '../../../shared/widgets/app_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppLayout(
        child: Column(
          children: [
            AppNavbar(),

            Expanded(
              child: Center(
                child: Text(
                  'Hero Section Gelecek',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
