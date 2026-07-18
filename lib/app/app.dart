import 'package:flutter/material.dart';
import '../features/home/presentation/home_page.dart';
import 'theme/app_theme.dart';

class ErcanAntApp extends StatelessWidget {
  const ErcanAntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ercan Ant',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
