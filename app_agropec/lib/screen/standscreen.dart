import 'package:app_agropec/components/cardstand.dart';
import 'package:flutter/material.dart';

class Standscreen extends StatelessWidget {
  const Standscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stands = [
      {
        'nome': 'AgroBoi Ltda',
        'local': 'Estandes A4',
        'sertor': 'Tecnologia Agrícola',
        'imagem': 'assets/images/boi.png',
      },
      {
        'nome': 'Marília Produtos',
        'local': 'Estandes B2',
        'sertor': 'Produtos Naturais',
        'imagem': 'assets/images/marilia.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Stands')),
      body: SingleChildScrollView(
        child: Column(
          children:
              stands.map((stand) {
                return Cardstand(
                  nome: stand['nome'] ?? '',
                  local: stand['local'] ?? '',
                  setor: stand['sertor'] ?? '',
                  imagem: stand['imagem'] ?? '',
                );
              }).toList(),
        ),
      ),
    );
  }
}
