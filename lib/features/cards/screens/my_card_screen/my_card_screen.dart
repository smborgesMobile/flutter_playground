import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card_carousel.dart';
import 'package:flutter_playground/features/cards/widgets/expense_item.dart';
import 'package:flutter_playground/features/cards/widgets/text_header.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = <ExpenseItem>[
      const ExpenseItem(
        title: 'Cab to home',
        subtitle: 'Uber',
        amount: 1450.48,
        isCredit: false, // debit
        time: '9:41 am',
        leadingIcon: Icons.local_taxi,
      ),
      const ExpenseItem(
        title: 'Salary',
        subtitle: 'Company Inc.',
        amount: 7500.00,
        isCredit: true, // credit
        time: '8:00 am',
        leadingIcon: Icons.account_balance_wallet_outlined,
      ),
      const ExpenseItem(
        title: 'Groceries',
        subtitle: 'Supermarket',
        amount: 320.70,
        isCredit: false, // debit
        time: 'Yesterday',
        leadingIcon: Icons.local_grocery_store_outlined,
      ),
      const ExpenseItem(
        title: 'Dinner',
        subtitle: 'Restaurant',
        amount: 120.00,
        isCredit: false,
        time: 'Mon, 20:15',
        leadingIcon: Icons.restaurant_outlined,
      ),
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BankCardCarousel(
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
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: TextHeader(title: 'Recent Transaction')),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => expenses[index],
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
