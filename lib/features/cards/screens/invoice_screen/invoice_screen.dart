import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Faturas',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Nenhuma fatura pendente.'),
                SizedBox(height: 8),
                Text('Toque no + para adicionar (exemplo).'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
