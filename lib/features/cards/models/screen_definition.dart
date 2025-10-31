import 'package:equatable/equatable.dart';
import 'component_base.dart';
import 'promotion_component.dart';
import 'header_component.dart';
import 'carousel_component.dart';
import 'expenses_list_component.dart';
import 'reminder_header_component.dart';
import 'reminders_list_component.dart';

// Re-export components so existing imports keep working
export 'component_base.dart';
export 'promotion_component.dart';
export 'header_component.dart';
export 'carousel_card_data.dart';
export 'carousel_component.dart';
export 'expense_item_data.dart';
export 'expenses_list_component.dart';
export 'reminder_header_component.dart';
export 'reminder_item_data.dart';
export 'reminders_list_component.dart';

class ScreenDefinition extends Equatable {
  final List<Component> slivers;
  const ScreenDefinition({required this.slivers});

  factory ScreenDefinition.fromJson(Map<String, dynamic> json) {
    final list = (json['slivers'] as List<dynamic>? ?? [])
        .map((e) => parseComponent(e as Map<String, dynamic>))
        .toList();
    return ScreenDefinition(slivers: list);
  }

  @override
  List<Object?> get props => [slivers];
}

/// Parse a single component from JSON
Component parseComponent(Map<String, dynamic> json) {
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
    case 'reminder_list':
      return RemindersListComponent.fromJson(json);
    default:
      return UnknownComponent(type);
  }
}
