import 'package:flutter/material.dart';
import 'adopcion_page.dart';
import 'refugios.dart';
import 'inicio_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Inicialmente en la primera pestaña (Inicio)

  // Lista de páginas: Inicio, Mascotas, Refugios
  final List<Widget> _pages = [
    InicioPage(),
    AdopcionPage(),
    RefugiosPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 🔹 Logo en el centro del AppBar
        title: Image.asset(
          'assets/images/AdoptPets.png',
          height: 40,
          fit: BoxFit.contain,
        ),
        backgroundColor: const Color(0xFF4CAF50), // verde
        centerTitle: true,
        elevation: 4,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Mascotas"),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "Refugios"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF4CAF50),
        onTap: _onItemTapped,
      ),
    );
  }
}