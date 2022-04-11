import 'package:flutter/material.dart';

TextFormField textField (TextEditingController controller,String hintText) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    controller: controller,
    decoration:  InputDecoration(
      border: InputBorder.none,
      hintText: hintText,
    ),
  );
}