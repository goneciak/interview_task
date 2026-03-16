import 'package:flutter/material.dart';
import 'package:interview_task/constants.dart';
import 'package:interview_task/l10n/app_localizations.dart';
import 'package:interview_task/utils/color_generator.dart';

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
    return _backgroundColor.computeLuminance() >
            AppConstants.backgroundColorLuminance
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
    final l10n = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.animationDuration,
        color: backgroundColor,
        child: Center(
          child: Text(
            l10n?.helloThere ?? 'Hello there!',
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
