import 'Pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Popcorn());
}

class Popcorn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Login_Page(),
      },
    );
  }
}
