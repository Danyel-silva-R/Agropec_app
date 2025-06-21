import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_agropec/components/menubuttom.dart';
import 'package:app_agropec/theme/theme.dart';
import 'package:app_agropec/components/carddestaques.dart'; // seu DestaquesScreen importado

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < patrocinadores.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> imagem = [
    Image.asset('assets/images/logobanner.png', fit: BoxFit.cover),
    Image.asset('assets/images/banner2.png', fit: BoxFit.cover),
    Image.asset('assets/images/baner2.png', fit: BoxFit.cover),
    Image.asset('assets/images/banner3.png', fit: BoxFit.cover),
    Image.asset('assets/images/banner4.png', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AGROPEC 2025', style: TextStyle(color: AppColors.white)),
          backgroundColor: AppColors.grand,
          actions: [
            IconButton(
              color: AppColors.white,
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                // Carrossel superior
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: CarouselView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    backgroundColor: Colors.transparent,
                    itemSnapping: true,
                    itemExtent: 350,
                    children: imagem,
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Bem-vindo! Explore estandes, Shows e a programação',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Destaques
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Veja os Destaques',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      400, // altura fixa pro DestaquesScreen funcionar bem dentro da scroll
                  child: DestaquesScreen(),
                ),

                SizedBox(height: 20),
                // Menu principal
                MenuButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Ver Programação',
                ),
                MenuButton(
                  icon: Icons.location_on_outlined,
                  text: 'Abrir Mapa',
                ),
                MenuButton(
                  icon: Icons.storefront_outlined,
                  text: 'Procurar Estandes',
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Patrocinadores',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: patrocinadores.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(patrocinadores[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> patrocinadores = [
  'assets/images/Frame 38.png',
  'assets/images/Frame 42.png',
  'assets/images/Frame 43.png',
  'assets/images/Frame 44.png',
  'assets/images/Frame 39.png',
  'assets/images/Frame 41.png',
];
