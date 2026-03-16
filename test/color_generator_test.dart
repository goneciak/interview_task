import 'package:flutter_test/flutter_test.dart';
import 'package:interview_task/utils/color_generator.dart';
import 'package:flutter/material.dart';

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

      expect(color.red, inInclusiveRange(0, 255));
      expect(color.green, inInclusiveRange(0, 255));
      expect(color.blue, inInclusiveRange(0, 255));
    });
  });
}
