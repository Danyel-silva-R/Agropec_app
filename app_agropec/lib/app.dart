import 'package:app_agropec/screen/evetosscreen.dart';
import 'package:app_agropec/screen/homescreen.dart';
import 'package:app_agropec/screen/mapscreen.dart';
import 'package:app_agropec/screen/standscreen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<App> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            const Homescreen(),
            const Mapscreen(),
            const Evetosscreen(),
            const Standscreen(),
            const Center(child: Text('Favoritos')),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.green,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Início',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.map),
              icon: Icon(Icons.map_outlined),
              label: 'Mapa',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.calendar_month),
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Eventos',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.storefront),
              icon: Icon(Icons.storefront_outlined),
              label: 'Stands',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
