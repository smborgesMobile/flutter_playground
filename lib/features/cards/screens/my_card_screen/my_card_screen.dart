import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Card Brand: Vista",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Card Number: 1020 1020 2020 3030"),
                    SizedBox(height: 8),
                    Text("Expiration: 10/01/2030"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
