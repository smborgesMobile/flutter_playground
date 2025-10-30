import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/cards/bloc/cards_screen_bloc.dart';
import 'package:flutter_playground/features/cards/data/cards_screen_repository.dart';
import 'package:flutter_playground/features/cards/models/screen_definition.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card.dart';
import 'package:flutter_playground/features/cards/widgets/bank_card_carousel.dart';
import 'package:flutter_playground/features/cards/widgets/expense_item.dart';
import 'package:flutter_playground/features/cards/widgets/promotion_item.dart';
import 'package:flutter_playground/features/cards/widgets/text_header.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardsScreenBloc(repository: const CardsScreenRepository())
        ..add(const CardsScreenRequested()),
      child: BlocBuilder<CardsScreenBloc, CardsScreenState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          }
          if (state.error != null) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text('Failed to load: ${state.error}')
                  ),
                ),
              ],
            );
          }

          final def = state.definition;
          if (def == null) {
            return const SizedBox.shrink();
          }

          return CustomScrollView(
            slivers: _buildSlivers(def),
          );
        },
      ),
    );
  }

  List<Widget> _buildSlivers(ScreenDefinition def) {
    final slivers = <Widget>[];
    for (final c in def.slivers) {
      if (c is CarouselComponent) {
        slivers.add(
          SliverToBoxAdapter(
            child: BankCardCarousel(
              height: 190,
              viewportFraction: 0.9,
              cards: c.cards
                  .map((d) => BankCard(
                        remainingCreditLabel: d.remainingCreditLabel,
                        remainingCreditAmount: d.remainingCreditAmount,
                        dailyCashbackText: d.dailyCashbackText,
                        totalAmount: d.totalAmount,
                        dueText: d.dueText,
                        brandAssetPath: d.brandAssetPath,
                      ))
                  .toList(),
            ),
          ),
        );
      } else if (c is HeaderComponent) {
        slivers.add(SliverToBoxAdapter(child: TextHeader(title: c.title)));
        slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 8)));
      } else if (c is ExpensesListComponent) {
        final items = c.items;
        slivers.add(
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = items[index];
                final isCredit = item.amount >= 0;
                final amount = item.amount.abs();
                return ExpenseItem(
                  title: item.title,
                  subtitle: item.subtitle,
                  amount: amount,
                  isCredit: isCredit,
                  time: item.time,
                  leadingIcon: _mapIcon(item.icon),
                );
              },
              childCount: items.length,
              addAutomaticKeepAlives: false,
              addSemanticIndexes: false,
            ),
          ),
        );
      } else if (c is PromotionComponent) {
        slivers.add(
          SliverToBoxAdapter(
            child: PromotionItem(
              imageUrl: c.imageUrl,
              title: c.title,
              buttonTitle: c.buttonTitle,
            ),
          ),
        );
      }
    }
    return slivers;
  }

  IconData _mapIcon(String name) {
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
