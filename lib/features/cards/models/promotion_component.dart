import 'component_base.dart';

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
