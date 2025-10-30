import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/fonts.dart';

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.buttonTitle,
  });

  final String imageUrl;
  final String title;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Color(0xFFFFD220),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagem ocupa ~60% da largura
          Expanded(
            flex: 5,
            child: SizedBox.expand(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    Image.asset('lib/assets/promotions.png', fit: BoxFit.fill),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
              ),
            ),
          ),
          // Texto ocupa ~40% da largura
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.promotionTitle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(buttonTitle, style: AppTypography.promotionButton),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_right_alt,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
