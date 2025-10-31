// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_playground/themes/bank_theme.dart';
import 'package:flutter_playground/themes/fonts.dart';

class ReminderHeader extends StatelessWidget {
  final String title;

  const ReminderHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.header),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("+ Add New", style: AppTypography.buttonTitle,),
            ),
          ),
        ],
      ),
    );
  }
}
