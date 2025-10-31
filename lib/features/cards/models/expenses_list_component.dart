import 'component_base.dart';
import 'expense_item_data.dart';

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
