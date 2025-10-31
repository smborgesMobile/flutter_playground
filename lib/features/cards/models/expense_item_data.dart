import 'package:equatable/equatable.dart';

class ExpenseItemData extends Equatable {
  final String title;
  final String subtitle;
  final double amount;
  final String time;
  final String icon;

  const ExpenseItemData({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.time,
    required this.icon,
  });

  factory ExpenseItemData.fromJson(Map<String, dynamic> json) {
    return ExpenseItemData(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      amount: (json['amount'] as num? ?? 0).toDouble(),
      time: json['time'] as String? ?? '',
      icon: json['icon'] as String? ?? 'receipt_long',
    );
  }

  @override
  List<Object?> get props => [title, subtitle, amount, time, icon];
}
