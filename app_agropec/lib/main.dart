import 'package:app_agropec/app.dart';
import 'package:flutter/material.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agropec Conecta 2025',
      theme: AppTheme.lightTheme, // aplica o tema
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
