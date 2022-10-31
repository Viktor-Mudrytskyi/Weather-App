import 'package:flutter/material.dart';
import 'package:wheather_app/home_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(name: "vinnytsia");
  }
}//gittest
