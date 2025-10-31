import 'package:equatable/equatable.dart';

class ReminderItemData extends Equatable {
  final String title;
  final String subtitle;
  final String icon;

  const ReminderItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  factory ReminderItemData.fromJson(Map<String, dynamic> json) {
    return ReminderItemData(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      icon: json['icon'] as String? ?? 'receipt_long',
    );
  }

  @override
  List<Object?> get props => [title, subtitle, icon];
}
