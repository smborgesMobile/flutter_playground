import 'component_base.dart';

class ReminderHeaderComponent extends Component {
  final String title;
  const ReminderHeaderComponent({required this.title})
    : super('reminder-header');

  factory ReminderHeaderComponent.fromJson(Map<String, dynamic> json) {
    return ReminderHeaderComponent(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}
