import 'component_base.dart';
import 'reminder_item_data.dart';

class RemindersListComponent extends Component {
  final List<ReminderItemData> items;
  const RemindersListComponent({required this.items}) : super('reminder_list');

  factory RemindersListComponent.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>? ?? [])
        .map((e) => ReminderItemData.fromJson(e as Map<String, dynamic>))
        .toList();
    return RemindersListComponent(items: items);
  }

  @override
  List<Object?> get props => [items];
}
