import 'package:flutter/material.dart';
import 'package:pos_mobile/screens/login_screen.dart';
import 'package:pos_mobile/screens/main_screen.dart';
import 'package:pos_mobile/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen()
      },
    );
  }
}
