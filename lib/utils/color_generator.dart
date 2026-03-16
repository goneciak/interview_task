import 'package:flutter/material.dart';
import 'dart:math';

class ColorGenerator {
  final Random _random = Random();

  Color generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
