import 'component_base.dart';

class HeaderComponent extends Component {
  final String title;
  const HeaderComponent({required this.title}) : super('header');

  factory HeaderComponent.fromJson(Map<String, dynamic> json) {
    return HeaderComponent(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}
