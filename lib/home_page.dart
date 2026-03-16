import 'package:flutter/material.dart';
import 'utils/color_generator.dart';
import 'l10n/app_localizations.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = AppConstants.initialBackgroundColor;
  final ColorGenerator _colorGenerator = ColorGenerator();

  void _changeColor() {
    setState(() {
      _backgroundColor = _colorGenerator.generateRandomColor();
    });
  }

  Color _getTextColor() {
    return _backgroundColor.computeLuminance() > 0.5
        ? AppConstants.darkTextColor
        : AppConstants.lightTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(
        backgroundColor: _backgroundColor,
        textColor: _getTextColor(),
        onTap: _changeColor,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const _Body({
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.animationDuration,
        color: backgroundColor,
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.helloThere,
            style: TextStyle(
              fontSize: AppConstants.textFontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
