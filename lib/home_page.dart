import 'package:flutter/material.dart';
import 'adopcion_page.dart';
import 'refugios.dart';
import 'inicio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botón de menú
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.grid_view_rounded,
                        color: Color(0xFF4CAF50),
                        size: 26,
                      ),
                      onPressed: () {
                        // Mostrar menú lateral o drawer
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Menú'),
                            backgroundColor: Color(0xFF4CAF50),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),

                  // Logo centrado
                  Image.asset(
                    'assets/images/AdoptPets.png',
                    height: 28,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'ADOPTPETS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                          letterSpacing: 1.5,
                        ),
                      );
                    },
                  ),

                  // Botón de perfil
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: Color(0xFF4CAF50),
                        size: 28,
                      ),
                      onPressed: () {
                        // Navegar a perfil
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Perfil'),
                            backgroundColor: Color(0xFF4CAF50),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Inicio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pets_outlined),
                  activeIcon: Icon(Icons.pets),
                  label: "Mascotas",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_city_outlined),
                  activeIcon: Icon(Icons.location_city),
                  label: "Refugios",
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color(0xFF4CAF50),
              unselectedItemColor: const Color(0xFF9E9E9E),
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedFontSize: 13,
              unselectedFontSize: 12,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}