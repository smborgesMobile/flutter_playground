import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';
import 'package:flutter_playground/themes/fonts.dart';

class CheckAllButton extends StatelessWidget {
  final String title;

  const CheckAllButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style: AppTypography.linkButtonText),
        SizedBox(width: 4),
        const Icon(Icons.arrow_right_alt, color: AppColors.primary,),
      ],
    );
  }
}
