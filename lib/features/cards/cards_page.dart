import 'package:flutter/material.dart';
import 'package:flutter_playground/features/cards/bloc/select_tab_cubit.dart';
import 'package:flutter_playground/features/cards/screens/my_card_screen/my_card_screen.dart';
import 'package:flutter_playground/features/cards/screens/invoice_screen/invoice_screen.dart';
import 'package:flutter_playground/features/cards/screens/emergency_screen/emergency_screen.dart';
import 'package:flutter_playground/themes/fonts.dart';
import 'package:flutter_playground/features/course/bloc/bloc/bloc_imports.dart';
import 'package:flutter_playground/themes/bank_theme.dart';
import 'package:flutter_playground/widget/floating_bottom_nav.dart';

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
        fontFamily: AppTypography.fontFamily,
        textTheme: AppTypography.textTheme,
      ),
      home: BlocProvider(
        create: (context) => SelectedTabCubit(),
        child: SafeArea(
          top: false,
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(title: Text("Cartões"), scrolledUnderElevation: 0.5),
            body: BlocBuilder<SelectedTabCubit, int>(
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
            bottomNavigationBar: BlocBuilder<SelectedTabCubit, int>(
              builder: (context, selected) {
                return FloatingBottomNav(
                  currentIndex: selected,
                  onTap: (i) => context.read<SelectedTabCubit>().select(i),
                  items: const [
                    FloatingBottomNavItem(
                      icon: Icons.home_outlined,
                      tooltip: 'home',
                    ),
                    FloatingBottomNavItem(
                      icon: Icons.credit_card_outlined,
                      tooltip: 'Papel de parede',
                    ),
                    FloatingBottomNavItem(
                      icon: Icons.add_chart_outlined,
                      tooltip: 'Outros',
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
