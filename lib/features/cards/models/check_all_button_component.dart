import 'component_base.dart';

class CheckAllButtonComponent extends Component {
  final String title;
  const CheckAllButtonComponent({required this.title}) : super('check_all_button');

  factory CheckAllButtonComponent.fromJson(Map<String, dynamic> json) {
    return CheckAllButtonComponent(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}
