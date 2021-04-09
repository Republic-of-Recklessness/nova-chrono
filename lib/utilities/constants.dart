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

InputDecoration inputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 5.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple, width: 3.0),
  ),
  labelText: 'List Name',
  fillColor: Colors.white,
  labelStyle: TextStyle(color: Colors.white),
);
