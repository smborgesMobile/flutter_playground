import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card_carousel.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BankCardCarousel(
          height: 190,
          viewportFraction: 0.9,
          onPageChanged: (i) => debugPrint('Selected card index: $i'),
          cards: const [
            BankCard(
              remainingCreditLabel: 'Crédito restante',
              remainingCreditAmount: 'R\$ 2.450,00',
              dailyCashbackText: 'Cashback diário: R\$ 25,00',
              totalAmount: 'R\$ 25.000,00',
              dueText: 'Vence em 6 dias',
              brandAssetPath: 'lib/assets/visa.png',
            ),
            BankCard(
              remainingCreditLabel: 'Limite disponível',
              remainingCreditAmount: 'R\$ 8.120,00',
              dailyCashbackText: 'Cashback diário: R\$ 12,00',
              totalAmount: 'R\$ 10.000,00',
              dueText: 'Vence amanhã',
              brandAssetPath: 'lib/assets/visa.png',
            ),
            BankCard(
              remainingCreditLabel: 'Saldo',
              remainingCreditAmount: 'R\$ 500,00',
              dailyCashbackText: 'Cashback diário: R\$ 2,50',
              totalAmount: 'R\$ 5.000,00',
              dueText: 'Vence em 12 dias',
              brandAssetPath: 'lib/assets/visa.png',
            ),
          ],
        ),
      ],
    );
  }
}
