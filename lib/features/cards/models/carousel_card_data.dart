import 'package:equatable/equatable.dart';

class CarouselCardData extends Equatable {
  final String remainingCreditLabel;
  final String remainingCreditAmount;
  final String dailyCashbackText;
  final String totalAmount;
  final String dueText;
  final String brandAssetPath;

  const CarouselCardData({
    required this.remainingCreditLabel,
    required this.remainingCreditAmount,
    required this.dailyCashbackText,
    required this.totalAmount,
    required this.dueText,
    required this.brandAssetPath,
  });

  factory CarouselCardData.fromJson(Map<String, dynamic> json) {
    return CarouselCardData(
      remainingCreditLabel: json['remainingCreditLabel'] as String? ?? '',
      remainingCreditAmount: json['remainingCreditAmount'] as String? ?? '',
      dailyCashbackText: json['dailyCashbackText'] as String? ?? '',
      totalAmount: json['totalAmount'] as String? ?? '',
      dueText: json['dueText'] as String? ?? '',
      brandAssetPath:
          json['brandAssetPath'] as String? ?? 'lib/assets/visa.png',
    );
  }

  @override
  List<Object?> get props => [
    remainingCreditLabel,
    remainingCreditAmount,
    dailyCashbackText,
    totalAmount,
    dueText,
    brandAssetPath,
  ];
}
