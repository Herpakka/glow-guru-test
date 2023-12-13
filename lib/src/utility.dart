import 'package:flutter/material.dart';

final kHintTextStyle = const TextStyle(
  color: Colors.white54,
  fontFamily: 'Mitr', // Replace with the correct font name
);

final kLabelStyle = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Mitr', // Replace with the correct font name
);

final kHeadStyle = const TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'Mitr', // Replace with the correct font name
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
