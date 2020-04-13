import 'package:flutter/material.dart';
import './widget/splashPage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LX'S Leader App",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
