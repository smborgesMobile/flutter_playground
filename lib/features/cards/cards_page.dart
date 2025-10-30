import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/bloc/select_tab_cubit.dart';
import 'package:flutter_playground/features/cards/widgets/bottom_navigation_item.dart';
import 'package:flutter_playground/features/cards/screens/my_card_screen/my_card_screen.dart';
import 'package:flutter_playground/features/cards/screens/invoice_screen/invoice_screen.dart';
import 'package:flutter_playground/features/cards/screens/emergency_screen/emergency_screen.dart';
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<SelectedTabCubit, int>(
                buildWhen: (p, c) => p != c,
                builder: (context, selected) {
                  switch (selected) {
                    case 0:
                      return const MyCardScreen();
                    case 1:
                      return const InvoiceScreen();
                    case 2:
                      return const EmergencyScreen();
                    default:
                      return const MyCardScreen();
                  }
                },
              ),
            ),
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
