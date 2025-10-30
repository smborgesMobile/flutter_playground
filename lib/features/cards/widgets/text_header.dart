import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/fonts.dart';

class TextHeader extends StatelessWidget {
  final String title;
  const TextHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 30),
      child: Text(
        title,
        style: AppTypography.header
      ),
    );
  }
}