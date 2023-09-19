import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: MainClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.blue, Colors.red],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
          ),
        ),
      ),
    );
  }
}

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double roundedFactor = 50;
    var path = Path();
    path.moveTo(0 + roundedFactor, size.height * 0.25);

    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundedFactor);

    path.lineTo(0, size.height - roundedFactor);
    path.quadraticBezierTo(0, size.height, roundedFactor, size.height);

    path.lineTo(size.width - roundedFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundedFactor);
    path.lineTo(size.width, roundedFactor);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundedFactor * 2, size.height * 0.1);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
