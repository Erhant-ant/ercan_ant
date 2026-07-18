import 'package:flutter/material.dart';

import '../../../shared/layout/app_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppLayout(
        child: Center(
          child: Text(
            'Ercan Ant',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
