import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.tooltip,
    this.activeColor,
    this.inactiveColor,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final String? tooltip;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    final primary = activeColor ?? Theme.of(context).colorScheme.primary;
    final unselected = inactiveColor ?? AppColors.neutral400;
    return IconButton(
      icon: Icon(icon, color: selected ? primary : unselected),
      tooltip: tooltip,
      onPressed: onTap,
    );
  }
}