import 'package:flutter/material.dart';

const back_grey = Color(0xFF424242);
final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
  side: BorderSide(
    width: 1,
    color: Colors.grey,
  ),
  minimumSize: Size(100, 50),
);
