import 'package:flutter/material.dart';
import 'color_generator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = Colors.white;
  final ColorGenerator _colorGenerator = ColorGenerator();

  void _changeColor() {
    setState(() {
      _backgroundColor = _colorGenerator.generateRandomColor();
    });
  }

  Color _getTextColor() {
    return _backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeColor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _backgroundColor,
          child: Center(
            child: Text(
              'Hello there',
              style: TextStyle(fontSize: 32, color: _getTextColor()),
            ),
          ),
        ),
      ),
    );
  }
}
