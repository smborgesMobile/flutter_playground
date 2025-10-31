import 'component_base.dart';
import 'shop_item_component.dart';

class ShopSectionComponent extends Component {
  final String title;
  final String description;
  final String checkAllTitle;
  final List<ShopItemComponent> items;

  const ShopSectionComponent({
    required this.title,
    required this.description,
    required this.checkAllTitle,
    required this.items,
  }) : super('shop_section');

  factory ShopSectionComponent.fromJson(Map<String, dynamic> json) {
    final rawItems = (json['items'] as List<dynamic>? ?? []);
    return ShopSectionComponent(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      checkAllTitle: json['checkAllTitle'] as String? ?? 'Check all',
      items: rawItems
          .map((e) => ShopItemComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [title, description, checkAllTitle, items];
}
