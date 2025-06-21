import 'package:app_agropec/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:app_agropec/screen/evetosscreen.dart';
import 'package:app_agropec/screen/homescreen.dart';
import 'package:app_agropec/screen/mapscreen.dart';
import 'package:app_agropec/screen/standscreen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Homescreen(),
    Mapscreen(),
    Evetosscreen(),
    Standscreen(),
    Center(child: Text('Favoritos')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.white,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              unselectedColor: const Color.fromARGB(255, 0, 0, 0),
              title: const Text("Início"),
              selectedColor: AppColors.primaryGreen,
            ),
            SalomonBottomBarItem(
              unselectedColor: const Color.fromARGB(255, 0, 0, 0),
              icon: const Icon(Icons.map),
              title: const Text("Mapa"),
              selectedColor: AppColors.primaryGreen,
            ),
            SalomonBottomBarItem(
              unselectedColor: const Color.fromARGB(255, 0, 0, 0),
              icon: const Icon(Icons.calendar_month),
              title: const Text("Eventos"),
              selectedColor: AppColors.primaryGreen,
            ),
            SalomonBottomBarItem(
              unselectedColor: const Color.fromARGB(255, 0, 0, 0),
              icon: const Icon(Icons.storefront),
              title: const Text("Stands"),
              selectedColor: AppColors.primaryGreen,
            ),
            SalomonBottomBarItem(
              unselectedColor: const Color.fromARGB(255, 0, 0, 0),
              icon: const Icon(Icons.favorite),
              title: const Text("Favoritos"),
              selectedColor: AppColors.primaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}
