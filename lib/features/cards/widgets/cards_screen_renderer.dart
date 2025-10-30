import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/models/screen_definition.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card_carousel.dart';
import 'package:flutter_playground/features/cards/widgets/expense_item.dart';
import 'package:flutter_playground/features/cards/widgets/promotion_item.dart';
import 'package:flutter_playground/features/cards/widgets/text_header.dart';

typedef ComponentSliverBuilder = List<Widget> Function(Component c);

class CardsScreenRenderer {
  CardsScreenRenderer._();

  static final Map<String, ComponentSliverBuilder> _defaultRegistry = {
    'carousel': _buildCarousel,
    'header': _buildHeader,
    'expenses_list': _buildExpenses,
    'promotion': _buildPromotion,
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
      default:
        return Icons.receipt_long;
    }
  }
}
