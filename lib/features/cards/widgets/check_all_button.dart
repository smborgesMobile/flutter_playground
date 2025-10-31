import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/fonts.dart';

class CheckAllButton extends StatelessWidget {
  final String title;

  const CheckAllButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTypography.linkButtonText)),
        const Icon(Icons.arrow_right_alt_outlined),
      ],
    );
  }
}
