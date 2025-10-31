import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/expense_icon.dart';
import 'package:flutter_playground/themes/fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isCredit,
    required this.time,
    required this.leadingIcon,
  });

  final String title;
  final String subtitle;
  final double amount;
  final bool isCredit;
  final String time;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    final amountStyle = isCredit
        ? AppTypography.amountCredit
        : AppTypography.amountDebit;
    final sign = isCredit ? '+' : '-';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExpenseIcon(leadingIcon: leadingIcon),
          const SizedBox(width: 19),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$sign₹${amount.toStringAsFixed(2)}', style: amountStyle),
                const SizedBox(height: 4),
                Text(time, style: AppTypography.expenseTime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
