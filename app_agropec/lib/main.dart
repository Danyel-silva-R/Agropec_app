import 'package:app_agropec/screen/homemscren.dart';
import 'package:flutter/material.dart';
import 'theme/theme.dart'; // certifique-se de que o caminho está certo

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
      home: Homemscren(),
    );
  }
}
