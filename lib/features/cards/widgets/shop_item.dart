import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';
import 'package:flutter_playground/themes/fonts.dart';

class ShopItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String value;
  final Color? backgroundColor;

  const ShopItem({
    super.key,
    this.icon = Icons.shopping_cart,
    required this.title,
    required this.description,
    required this.value,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.neutral100;
    return Container(
      width: 159,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.textPrimary),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTypography.promotionTitle.copyWith(
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTypography.promotionTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.promotionTitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
