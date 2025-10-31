import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/shop_item.dart';
import 'package:flutter_playground/features/cards/widgets/check_all_button.dart';
import 'package:flutter_playground/features/cards/widgets/text_header.dart';
import 'package:flutter_playground/themes/fonts.dart';

class ShopComponent extends StatelessWidget {
  final String title;
  final String description;
  final String checkAllTitle;
  final List<ShopItem> items;

  const ShopComponent({
    super.key,
    required this.title,
    required this.description,
    required this.checkAllTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeader(title: title),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                description,
                style: AppTypography.promotionTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => items[index],
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: items.length,
                ),
              ),
              const SizedBox(height: 12),
              CheckAllButton(title: checkAllTitle),
            ],
          ),
        ),
      ],
    );
  }
}
