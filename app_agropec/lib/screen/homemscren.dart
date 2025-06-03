import 'package:flutter/material.dart';

class Homemscren extends StatelessWidget {
  const Homemscren({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AGROPEC'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              label: 'mapa',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'eventos',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'stands',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              label: 'favoritos',
            ),
          ],
        ),
      ),
    );
  }
}
