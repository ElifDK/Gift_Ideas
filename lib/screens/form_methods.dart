import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(Icon icon, String text) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    label: SizedBox(
      width: 150,
      child: Row(
        children: [icon, Text(text)],
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
