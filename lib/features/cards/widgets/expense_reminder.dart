import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/expense_icon.dart';
import 'package:flutter_playground/themes/fonts.dart';

class ExpenseReminderItem extends StatelessWidget {
  final IconData leadIcon;
  final String title;
  final String subtitle;

  const ExpenseReminderItem({
    super.key,
    required this.leadIcon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpenseIcon(leadingIcon: leadIcon),
        const SizedBox(width: 19),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.expenseTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTypography.expenseSubtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_right_alt_outlined),
      ],
    );
  }
}
