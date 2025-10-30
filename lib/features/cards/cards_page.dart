import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/bloc/select_tab_cubit.dart';
import 'package:flutter_playground/features/cards/widgets/bottom_navigation_item.dart';
import 'package:flutter_playground/features/course/bloc/bloc/bloc_imports.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColors.createMaterialColor(AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.error,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.textPrimary,
        ),
      ),
      home: BlocProvider(
        create: (context) => SelectedTabCubit(),
        child: SafeArea(
          top: false,
          child: Scaffold(
            appBar: AppBar(title: Text("Cartões"), scrolledUnderElevation: 0.5),
            body: const Column(),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: BlocBuilder<SelectedTabCubit, int>(
                builder: (context, selected) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomNavigationItem(
                        icon: Icons.card_travel_outlined,
                        selected: selected == 0,
                        onTap: () => context.read<SelectedTabCubit>().select(0),
                        tooltip: 'Cartões',
                      ),
                      BottomNavigationItem(
                        icon: Icons.wallpaper_outlined,
                        selected: selected == 1,
                        onTap: () => context.read<SelectedTabCubit>().select(1),
                        tooltip: 'Papel de parede',
                      ),
                      BottomNavigationItem(
                        icon: Icons.fire_truck_outlined,
                        selected: selected == 2,
                        onTap: () => context.read<SelectedTabCubit>().select(2),
                        tooltip: 'Outros',
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
