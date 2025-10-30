import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/fonts.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    super.key,
    this.height = 200,
    this.borderRadius = 16,
    this.remainingCreditLabel = 'Remaining Credit',
    this.remainingCreditAmount = 'R\$ 2,450.00',
    this.dailyCashbackText = 'Daily Cashback: R\$ 25.00',
    this.totalAmount = 'R\$ 25,000.00',
    this.dueText = 'Due in 6 days',
    this.brandAssetPath = 'lib/assets/visa.png',
    this.onPayNow,
  });

  final double height;
  final double borderRadius;
  final String remainingCreditLabel;
  final String remainingCreditAmount;
  final String dailyCashbackText;
  final String totalAmount;
  final String dueText;
  final String brandAssetPath;
  final VoidCallback? onPayNow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF52B6FE),
                Color(0xFF6154FE),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          remainingCreditLabel,
                          style: AppTypography.regular,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          remainingCreditAmount,
                          style: AppTypography.onPrimaryTitle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dailyCashbackText,
                          style: AppTypography.regular,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          totalAmount,
                          style: AppTypography.regular,
                        ),
                        Text(
                          dueText,
                          style: AppTypography.regular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 4),
                    child: Image.asset(
                      brandAssetPath,
                      width: 50,
                      height: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: onPayNow,
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 12.0, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF5AE677),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          'Pay Now',
                          style: AppTypography.onPrimaryTitle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
