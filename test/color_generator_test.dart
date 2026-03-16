import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_task/constants.dart';
import 'package:interview_task/utils/color_generator.dart';

void main() {
  group('ColorGenerator', () {
    test('generateRandomColor returns a valid Color', () {
      final generator = ColorGenerator();

      final color = generator.generateRandomColor();

      expect(color, isA<Color>());
    });

    test('generated color has valid RGB values', () {
      final generator = ColorGenerator();

      final color = generator.generateRandomColor();

      expect(
        color.red,
        inInclusiveRange(0, AppConstants.maxColorComponentValue),
      );
      expect(
        color.green,
        inInclusiveRange(0, AppConstants.maxColorComponentValue),
      );
      expect(
        color.blue,
        inInclusiveRange(0, AppConstants.maxColorComponentValue),
      );
    });
  });
}
