import 'package:flutter/material.dart';
import 'package:flutter_slivers_demo/splash_screen.dart';
import 'slivers_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}
