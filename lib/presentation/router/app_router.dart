import 'package:counter_bloc/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'Home',
                  color: Colors.pinkAccent,
                ));
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second',
            color: Colors.greenAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third',
            color: Colors.yellowAccent,
          ),
        );
      default: return null;
    }
  }
}
