import 'dart:math';
import 'package:flutter/material.dart';
import 'package:interview_task/constants.dart';

class ColorGenerator {
  final Random _random = Random();

  Color generateRandomColor() {
    return Color.fromARGB(
      AppConstants.maxColorComponentValue,
      _random.nextInt(AppConstants.maxColorValue),
      _random.nextInt(AppConstants.maxColorValue),
      _random.nextInt(AppConstants.maxColorValue),
    );
  }
}
