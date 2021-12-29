import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/core/error/services/navigation_handler.dart';
import 'package:poc_flutter_mobx/injection_container.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: inject.get<NavigationHandler>().appRoutes,
      initialRoute: '/',
    );
  }
}
