import 'package:flutter/material.dart';
import 'package:app_agropec/components/cardevento.dart';

class Evetosscreen extends StatelessWidget {
  const Evetosscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> eventos = [
      {'imagem': 'assets/images/Felipea.png'},
      {'imagem': 'assets/images/marilia.png'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Eventos')),
      body: SingleChildScrollView(
        child: Column(
          children:
              eventos.map((evento) {
                return Cardevento(
                  imagem: evento['imagem'] ?? '',

                  // imagem: evento['imagem'] ?? '',
                );
              }).toList(),
        ),
      ),
    );
  }
}
