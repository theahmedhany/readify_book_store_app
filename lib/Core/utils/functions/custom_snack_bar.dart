import 'package:flutter/material.dart';

void ShowSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Color(0xff1A3636),
          fontSize: 17,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xff9CA986),
    ),
  );
}
