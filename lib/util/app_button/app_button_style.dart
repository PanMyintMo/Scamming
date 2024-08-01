import 'package:flutter/material.dart';

MaterialButton appbutton(
  BuildContext context,
  VoidCallback onPressed, {
  required String btnText,
}) {
  return MaterialButton(
    minWidth: double.infinity,
    height: 50,
    color: Theme.of(context).primaryColor,
    textColor: Colors.blue,
    onPressed: onPressed,
    child: Text(btnText),
  );
}
