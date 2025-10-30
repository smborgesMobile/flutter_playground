import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Emergência',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: 12),
        Card(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Icon(Icons.local_hospital_outlined),
                SizedBox(width: 12),
                Expanded(child: Text('Contate o suporte imediatamente.')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
