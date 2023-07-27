import 'package:flutter/material.dart';
import 'package:jenga_app/screens/dashboard.dart';
import 'package:jenga_app/screens/loginscreen.dart';
import 'package:jenga_app/screens/upload_pdf.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login' : (context) => const LoginScreen(),
      '/dashboard': (context) => const DashboardsCreen(),
      '/upload': (context) => const UploadServer(),
    },
      // home: const LoginScreen() ,
    );
  }
}
