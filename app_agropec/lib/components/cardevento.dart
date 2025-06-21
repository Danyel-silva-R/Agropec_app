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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // mesmo raio do Container
        child: Container(
          width: double.infinity,
          height: screenWidth < 300 ? 220 : 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagem),
              fit: BoxFit.contain,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (texto != null)
                  Text(
                    texto!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                if (data != null)
                  Text(
                    data!,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
