import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:money/view/page/page.dart';

void main() {
  runApp(MyApp());
}

const Map<String, Color> pallets = {
  'primary': Color(0xFF25C0F3),
  'accent1': Color(0xFFACEBFF),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto Slab',
        primaryColor: pallets['primary'],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}


