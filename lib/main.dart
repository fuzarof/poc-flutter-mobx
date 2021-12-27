import 'package:flutter/material.dart';
import 'package:poc_flutter_mobx/injection_container.dart';
import 'package:poc_flutter_mobx/routes.dart';

void main() {
  setUpDI();
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
      routes: routes,
      initialRoute: '/',
    );
  }
}
