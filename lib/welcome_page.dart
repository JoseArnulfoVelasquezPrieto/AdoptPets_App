import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 👇 Logo principal blanco con contorno
            Stack(
              alignment: Alignment.center,
              children: [
                // Sombra / contorno
                Image.asset(
                  'assets/images/AdoptPets.png',
                  height: 50,
                  fit: BoxFit.contain,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.srcIn,
                ),
                // Logo blanco encima
                Image.asset(
                  'assets/images/AdoptPets.png',
                  height: 50,
                  fit: BoxFit.contain,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 👇 Icono de huella
            const Icon(
              Icons.pets,
              size: 130,
              color: Colors.white,
            ),
            const SizedBox(height: 20),

            // 👇 Emoji de perrito 🐶 debajo de la huella
            const Text(
              '🐶',
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF4CAF50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}