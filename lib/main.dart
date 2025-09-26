import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'welcome_page.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  await DatabaseHelper.insertInitialData();
  runApp(const AdoptPetsApp());
}

class AdoptPetsApp extends StatelessWidget {
  const AdoptPetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AdoptPets',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(), // ⚠️ quitar const
      },
    );
  }
}