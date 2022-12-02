
import 'package:flutter/material.dart';
import 'package:jokenpo/screens/home.dart';

void main() {
  runApp(const Jokenpo());
}

class Jokenpo extends StatelessWidget {
  const Jokenpo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokenpô',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}