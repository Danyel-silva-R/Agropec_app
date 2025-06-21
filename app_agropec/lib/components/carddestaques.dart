import 'package:flutter/material.dart';

class DestaquesScreen extends StatefulWidget {
  const DestaquesScreen({super.key});

  @override
  State<DestaquesScreen> createState() => _DestaquesScreenState();
}

class _DestaquesScreenState extends State<DestaquesScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> destaques = [
    {
      'image': 'assets/images/marilia.png',
      'title': 'Marilia Tavares',
      'description': 'Shows muito especial dessa cantora.',
    },
    {
      'image': 'assets/images/Felipea.png',
      'title': 'Felipe Amorin',
      'description': 'O cantor apaixonado',
    },
    {
      'image': 'assets/images/banner3.png',
      'title': 'Shows & Eventos',
      'description': 'Aproveite shows incríveis todas as noites da feira.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Aqui definimos uma altura fixa
      height: 400, // ajuste conforme seu design
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: destaques.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = destaques[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image']!,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20),
                        Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            item['description']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(destaques.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
