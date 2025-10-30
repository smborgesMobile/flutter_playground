import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BankCard(),
        ],
      ),
    );
  }
}
