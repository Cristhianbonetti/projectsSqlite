import 'package:flutter/material.dart';
import 'package:projectsqlite/view/addEmployee.dart';
import 'package:projectsqlite/view/homePage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/addEmployee':
        return MaterialPageRoute(builder: (_) => const AddEmployee());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('nenhuma Rota'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'Desculpe, nenhuma rota foi encontrada!',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
