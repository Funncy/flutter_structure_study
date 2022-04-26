import 'package:flutter/material.dart';

mixin InputDecoratorMixin {
  InputDecoration textInputDecor(String text) {
    return InputDecoration(
      hintStyle: const TextStyle(color: Colors.black),
      labelStyle: const TextStyle(color: Colors.black),
      labelText: text,
      enabledBorder: activeInputBorder(),
      focusedBorder: activeInputBorder(),
      errorBorder: errorInputBorder(),
      focusedErrorBorder: errorInputBorder(),
    );
  }

  UnderlineInputBorder errorInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    );
  }

  UnderlineInputBorder activeInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
  }
}
