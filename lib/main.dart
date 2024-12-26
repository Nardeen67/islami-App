import 'package:flutter/material.dart';
import 'sebha.dart';


void main() {
  runApp(const TasbihApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  TasbihScreen(),
    );
  }
}


