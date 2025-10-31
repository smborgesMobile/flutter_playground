import 'package:equatable/equatable.dart';

class ScreenDefinition extends Equatable {
  final List<Component> slivers;
  const ScreenDefinition({required this.slivers});

  factory ScreenDefinition.fromJson(Map<String, dynamic> json) {
    final list = (json['slivers'] as List<dynamic>? ?? [])
        .map((e) => Component.fromJson(e as Map<String, dynamic>))
        .toList();
    return ScreenDefinition(slivers: list);
  }

  @override
  List<Object?> get props => [slivers];
}

abstract class Component extends Equatable {
  final String type;
  const Component(this.type);

  static Component fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String? ?? '';
    switch (type) {
      case 'promotion':
        return PromotionComponent.fromJson(json);
      case 'header':
        return HeaderComponent.fromJson(json);
      case 'carousel':
        return CarouselComponent.fromJson(json);
      case 'expenses_list':
        return ExpensesListComponent.fromJson(json);
      case 'reminder-header':
        return ReminderHeaderComponent.fromJson(json);
      default:
        return UnknownComponent(type);
    }
  }
}

class UnknownComponent extends Component {
  const UnknownComponent(String type) : super(type);

  @override
  List<Object?> get props => [type];
}

class PromotionComponent extends Component {
  final String imageUrl;
  final String title;
  final String buttonTitle;
  const PromotionComponent({
    required this.imageUrl,
    required this.title,
    required this.buttonTitle,
  }) : super('promotion');

  factory PromotionComponent.fromJson(Map<String, dynamic> json) {
    return PromotionComponent(
      imageUrl: json['imageUrl'] as String? ?? '',
      title: json['title'] as String? ?? '',
      buttonTitle: json['buttonTitle'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [imageUrl, title, buttonTitle];
}

class HeaderComponent extends Component {
  final String title;
  const HeaderComponent({required this.title}) : super('header');

  factory HeaderComponent.fromJson(Map<String, dynamic> json) {
    return HeaderComponent(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}

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

class CarouselComponent extends Component {
  final List<CarouselCardData> cards;
  const CarouselComponent({required this.cards}) : super('carousel');

  factory CarouselComponent.fromJson(Map<String, dynamic> json) {
    final cards = (json['cards'] as List<dynamic>? ?? [])
        .map((e) => CarouselCardData.fromJson(e as Map<String, dynamic>))
        .toList();
    return CarouselComponent(cards: cards);
  }

  @override
  List<Object?> get props => [cards];
}

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

class ExpensesListComponent extends Component {
  final List<ExpenseItemData> items;
  const ExpensesListComponent({required this.items}) : super('expenses_list');

  factory ExpensesListComponent.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>? ?? [])
        .map((e) => ExpenseItemData.fromJson(e as Map<String, dynamic>))
        .toList();
    return ExpensesListComponent(items: items);
  }

  @override
  List<Object?> get props => [items];
}

class ReminderHeaderComponent extends Component {
  final String title;
  const ReminderHeaderComponent({required this.title}) : super('reminder-header');

  factory ReminderHeaderComponent.fromJson(Map<String, dynamic> json) {
    return ReminderHeaderComponent(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}
