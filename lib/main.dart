import 'package:flutter/material.dart';
import 'package:jenga_app/screens/dashboard.dart';
import 'package:jenga_app/screens/loginscreen.dart';
import 'common_component/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Future Admin',
      theme: customAppTheme,
      initialRoute: '/login',
      routes: {
      '/login' : (context) => const LoginScreen(),
      '/dashboard': (context) => const DashboardsCreen(),
    },
      // home: const LoginScreen() ,
    );
  }
}
