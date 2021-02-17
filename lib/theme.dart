import 'package:flutter/material.dart';

const Map<String, Color> pallets = {
  'primary': Color(0xFF0AA5D8),
  'accent1': Color(0xFFC6ECF9),
  'accent2': Color(0xFF96D8FD),
  'accent3': Color(0xFF90F1EB),
  'text1': Color(0xFF114759),
};

const TextStyle title = TextStyle(
  color: Color(0xFF114759),
  fontSize: 24,
  fontWeight: FontWeight.bold
);

const TextStyle subtitle = TextStyle(
  color: Color(0xFF114759),
  fontSize: 20,
);

List<BoxShadow> boxShadow = [
  BoxShadow(
    color: pallets['primary'].withOpacity(0.2),
    offset: const Offset(5,5),
    blurRadius: 20
  )
];