import 'component_base.dart';
import 'carousel_card_data.dart';

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
