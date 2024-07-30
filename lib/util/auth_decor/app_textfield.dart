import 'package:flutter/material.dart';
import 'package:student_registration/util/auth_decor/decoration.dart';

TextField appTextField(
    {required dynamic controller, required dynamic labelText}) {
  return TextField(
    controller: controller,
    decoration: authdecor(labelText: labelText),
  );
}
