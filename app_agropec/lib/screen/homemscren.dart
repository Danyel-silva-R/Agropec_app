import 'package:flutter/material.dart';

class Homemscren extends StatefulWidget {
  const Homemscren({super.key});

  @override
  State<Homemscren> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homemscren> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGROPEC'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Página com imagem de fundo
          Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/fundo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: const [
                      Text(
                        'Bem-vindo à AGROPEC!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Outras páginas
          const Center(child: Text('Mapa')),
          const Center(child: Text('Eventos')),
          const Center(child: Text('Stands')),
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
          NavigationDestination(icon: Icon(Icons.map_outlined), label: 'Mapa'),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Eventos',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            label: 'Stands',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
