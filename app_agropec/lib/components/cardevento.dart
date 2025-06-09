import 'package:flutter/material.dart';

class Cardevento extends StatelessWidget {
  const Cardevento({super.key, required this.imagem, this.texto, this.data});

  final String imagem;
  final String? texto;
  final String? data;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem com bordas arredondadas
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imagem,
                width: double.infinity,
                height: screenWidth < 400 ? 180 : 220,
                fit: BoxFit.contain,
              ),
            ),
            if (texto != null || data != null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (texto != null)
                      Text(
                        texto!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (data != null)
                      Text(
                        data!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
