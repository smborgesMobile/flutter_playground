import 'package:flutter/material.dart';

class ExpenseIcon extends StatelessWidget {
  final IconData leadingIcon;

  const ExpenseIcon({super.key, required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Icon(leadingIcon, size: 24, color: Colors.black87),
    );
  }
}
