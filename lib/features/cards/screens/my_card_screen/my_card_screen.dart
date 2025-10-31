import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/features/cards/bloc/cards_screen_bloc.dart';
import 'package:flutter_playground/features/cards/data/cards_screen_repository.dart';
import 'package:flutter_playground/features/cards/widgets/cards_screen_renderer.dart';
import 'package:flutter_playground/widget/floating_bottom_nav.dart';


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

          final slivers = CardsScreenRenderer.buildSlivers(def);
          slivers.add(const BottomNavSliverSpacer());
          return CustomScrollView(slivers: slivers);
        },
      ),
    );
  }
}
