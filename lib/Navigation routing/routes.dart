import 'package:flutter/material.dart';

import 'navigation_example.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'first page':
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case 'second page':
        return MaterialPageRoute(builder: (_) => const SecondPage());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(child: Text('No Routes Found')),
          ));
}
