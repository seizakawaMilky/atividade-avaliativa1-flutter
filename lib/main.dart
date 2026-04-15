import 'package:flutter/material.dart';

import 'screens/cadastro_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle de Leitura',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),

      initialRoute: AppRoutes.cadastro,

      routes: {
        AppRoutes.cadastro: (_) => const CadastroScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
      },
    );
  }
}