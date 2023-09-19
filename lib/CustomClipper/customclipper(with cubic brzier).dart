import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: const Center(child: Text("hello")),
          ),
          ClipPath(
            clipper: CubicClipper(),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CubicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double wave = 50;
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.cubicTo(wave * 4, size.height * 0.4, wave * 4, size.height * 0.8,
        size.width, size.height * 0.5);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
