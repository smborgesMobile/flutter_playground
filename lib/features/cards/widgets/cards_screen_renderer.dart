import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/models/screen_definition.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card_carousel.dart';
import 'package:flutter_playground/features/cards/widgets/expense_item.dart';
import 'package:flutter_playground/features/cards/widgets/expense_reminder.dart';
import 'package:flutter_playground/features/cards/widgets/promotion_item.dart';
import 'package:flutter_playground/features/cards/widgets/reminder_header.dart';
import 'package:flutter_playground/features/cards/widgets/text_header.dart';
import 'package:flutter_playground/features/cards/widgets/check_all_button.dart';
import 'package:flutter_playground/features/cards/widgets/shop_item.dart';
import 'package:flutter_playground/features/cards/widgets/shop_component.dart';

typedef ComponentSliverBuilder = List<Widget> Function(Component c);

class CardsScreenRenderer {
  CardsScreenRenderer._();

  static final Map<String, ComponentSliverBuilder> _defaultRegistry = {
    'carousel': _buildCarousel,
    'header': _buildHeader,
    'expenses_list': _buildExpenses,
    'promotion': _buildPromotion,
    'reminder-header': _buildRimenderHeader,
    'reminder_list': _buildReminders,
    'check_all_button': _buildCheckAllButton,
    'shop_item': _buildShopItem,
    'shop_section': _buildShopSection,
  };

  static List<Widget> buildSlivers(
    ScreenDefinition def, {
    Map<String, ComponentSliverBuilder>? overrides,
  }) {
    final registry = {..._defaultRegistry, if (overrides != null) ...overrides};
    final slivers = <Widget>[];
    for (final c in def.slivers) {
      final builder = registry[c.type];
      if (builder == null) continue; // unknown type -> ignore safely
      slivers.addAll(builder(c));
    }
    return slivers;
  }

  // Builders
  static List<Widget> _buildCarousel(Component c) {
    final comp = c is CarouselComponent ? c : null;
    if (comp == null || comp.cards.isEmpty) return const [];
    return [
      SliverToBoxAdapter(
        child: BankCardCarousel(
          key: const PageStorageKey('cards_carousel'),
          height: 190,
          viewportFraction: 0.9,
          cards: comp.cards
              .map(
                (d) => BankCard(
                  remainingCreditLabel: d.remainingCreditLabel,
                  remainingCreditAmount: d.remainingCreditAmount,
                  dailyCashbackText: d.dailyCashbackText,
                  totalAmount: d.totalAmount,
                  dueText: d.dueText,
                  brandAssetPath: d.brandAssetPath,
                ),
              )
              .toList(growable: false),
        ),
      ),
    ];
  }

  static List<Widget> _buildHeader(Component c) {
    final comp = c is HeaderComponent ? c : null;
    if (comp == null || comp.title.isEmpty) return const [];
    return [
      SliverToBoxAdapter(child: TextHeader(title: comp.title)),
      const SliverToBoxAdapter(child: SizedBox(height: 8)),
    ];
  }

  static List<Widget> _buildRimenderHeader(Component c) {
    final comp = c is ReminderHeaderComponent ? c : null;
    if (comp == null || comp.title.isEmpty) return const [];
    return [
      const SliverToBoxAdapter(child: SizedBox(height: 8)),
      SliverToBoxAdapter(child: ReminderHeader(title: comp.title)),
      const SliverToBoxAdapter(child: SizedBox(height: 8)),
    ];
  }

  static List<Widget> _buildExpenses(Component c) {
    final comp = c is ExpensesListComponent ? c : null;
    if (comp == null || comp.items.isEmpty) return const [];

    // Pre-resolve icon strings once to avoid mapping per-row build
    final icons = comp.items
        .map((e) => _iconFor(e.icon))
        .toList(growable: false);

    return [
      // Insert a header before list if previous header was swallowed by registry
      // The JSON usually provides a header entry; we keep this renderer focused.
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = comp.items[index];
            final isCredit = item.amount >= 0;
            final amount = item.amount.abs();
            return ExpenseItem(
              title: item.title,
              subtitle: item.subtitle,
              amount: amount,
              isCredit: isCredit,
              time: item.time,
              leadingIcon: icons[index],
            );
          },
          childCount: comp.items.length,
          addAutomaticKeepAlives: false,
          addSemanticIndexes: false,
        ),
      ),
    ];
  }

  static List<Widget> _buildPromotion(Component c) {
    final comp = c is PromotionComponent ? c : null;
    if (comp == null) return const [];
    return [
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
      SliverToBoxAdapter(
        child: PromotionItem(
          imageUrl: comp.imageUrl,
          title: comp.title,
          buttonTitle: comp.buttonTitle,
        ),
      ),
    ];
  }

  static List<Widget> _buildReminders(Component c) {
    final comp = c is RemindersListComponent ? c : null;
    if (comp == null || comp.items.isEmpty) return const [];

    final icons = comp.items
        .map((e) => _iconFor(e.icon))
        .toList(growable: false);

    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = comp.items[index];
              final bottom = index == comp.items.length - 1 ? 0.0 : 12.0;
              return Padding(
                padding: EdgeInsets.only(bottom: bottom),
                child: ExpenseReminderItem(
                  leadIcon: icons[index],
                  title: item.title,
                  subtitle: item.subtitle,
                ),
              );
            },
            childCount: comp.items.length,
            addAutomaticKeepAlives: false,
            addSemanticIndexes: false,
          ),
        ),
      ),
    ];
  }

  static List<Widget> _buildCheckAllButton(Component c) {
    final comp = c is CheckAllButtonComponent ? c : null;
    if (comp == null || comp.title.isEmpty) return const [];
    return [
      const SliverToBoxAdapter(child: SizedBox(height: 12)),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: CheckAllButton(title: comp.title),
        ),
      ),
    ];
  }

  static List<Widget> _buildShopItem(Component c) {
    final comp = c is ShopItemComponent ? c : null;
    if (comp == null || comp.title.isEmpty) return const [];

    final bgColor = _parseColor(comp.backgroundColor);
    final icon = _iconFor(comp.icon);

    return [
      const SliverToBoxAdapter(child: SizedBox(height: 12)),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: ShopItem(
            icon: icon,
            title: comp.title,
            description: comp.description,
            value: comp.value,
            backgroundColor: bgColor,
          ),
        ),
      ),
    ];
  }

  static List<Widget> _buildShopSection(Component c) {
    final comp = c is ShopSectionComponent ? c : null;
    if (comp == null || comp.items.isEmpty) return const [];

    final items = <ShopItem>[];
    for (var i = 0; i < comp.items.length; i++) {
      final it = comp.items[i];
      final parsedColor = _parseColor(it.backgroundColor);
      final bg = parsedColor ?? (i.isEven ? const Color(0xFFBBDEFB) : const Color(0xFFFFF9C4));
      items.add(
        ShopItem(
          icon: _iconFor(it.icon),
          title: it.title,
          description: it.description,
          value: it.value,
          backgroundColor: bg,
        ),
      );
    }

    return [
      const SliverToBoxAdapter(child: SizedBox(height: 4)),
      SliverToBoxAdapter(
        child: ShopComponent(
          title: comp.title,
          description: comp.description,
          checkAllTitle: comp.checkAllTitle,
          items: items,
        ),
      ),
    ];
  }

  static IconData _iconFor(String name) {
    switch (name) {
      case 'local_taxi':
        return Icons.local_taxi;
      case 'account_balance_wallet_outlined':
        return Icons.account_balance_wallet_outlined;
      case 'local_grocery_store_outlined':
        return Icons.local_grocery_store_outlined;
      case 'restaurant_outlined':
        return Icons.restaurant_outlined;
      case 'shield_outlined':
        return Icons.shield_outlined;
      case 'credit_card_outlined':
        return Icons.credit_card_outlined;
      case 'receipt_long':
        return Icons.receipt_long;
      case 'shopping_cart':
        return Icons.shopping_cart;
      case 'shopping_cart_outlined':
        return Icons.shopping_cart_outlined;
      default:
        return Icons.receipt_long;
    }
  }

  static Color? _parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    var value = hex.trim();
    if (value.startsWith('#')) value = value.substring(1);
    // If RRGGBB, prepend FF alpha
    if (value.length == 6) value = 'FF$value';
    if (value.length == 8) {
      try {
        final intVal = int.parse(value, radix: 16);
        return Color(intVal).withAlpha((intVal >> 24) & 0xFF);
      } catch (_) {
        return null;
      }
    }
    // Fallback for 0xAARRGGBB
    if (value.startsWith('0x')) {
      try {
        return Color(int.parse(value));
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
