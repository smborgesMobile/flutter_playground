import 'component_base.dart';

class ShopItemComponent extends Component {
  final String icon; 
  final String title;
  final String description;
  final String value;
  final String? backgroundColor; 

  const ShopItemComponent({
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    this.backgroundColor,
  }) : super('shop_item');

  factory ShopItemComponent.fromJson(Map<String, dynamic> json) {
    return ShopItemComponent(
      icon: json['icon'] as String? ?? 'shopping_cart',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      value: json['value'] as String? ?? '',
      backgroundColor: json['backgroundColor'] as String?,
    );
  }

  @override
  List<Object?> get props => [icon, title, description, value, backgroundColor];
}
