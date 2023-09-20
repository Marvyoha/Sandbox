import 'package:flutter/material.dart';
import 'package:sand_box/Provider%20practice/movie_provider.dart';
import 'package:sand_box/Provider%20practice/movie_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MovieProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieScreen(),
    );
  }
}
