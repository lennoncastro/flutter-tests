import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'module.dart';

void main() => runApp(ModularApp(module: Module()));

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: "/",
    );
  }
}
