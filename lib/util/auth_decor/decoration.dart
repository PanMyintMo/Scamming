import 'package:flutter/material.dart';

InputDecoration authdecor({required dynamic labelText,Widget? suffixIcon}) {
  return InputDecoration(
    labelText: labelText,
    suffixIcon: suffixIcon,
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
  );
}
