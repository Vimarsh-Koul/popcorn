import 'Pages/login.dart';
import 'package:flutter/material.dart';
import 'Pages/home.dart';

void main() {
  runApp(Popcorn());
}

class Popcorn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Login_Page(),
        '/home': (context) => Home(),
      },
    );
  }
}
