import 'package:flutter/material.dart';
import 'package:sand_box/Navigation%20routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: 'first page',
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('First Page'),
          const Text('This is the first page'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'second page');
              },
              child: const Text('Next page')),
        ],
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Second Page'),
          const Text('This is the second page'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'first page');
              },
              child: const Text('Previous page')),
        ],
      )),
    );
  }
}
