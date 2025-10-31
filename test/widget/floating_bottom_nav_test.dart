import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_playground/widget/floating_bottom_nav.dart';

void main() {
  testWidgets('FloatingBottomNav renders with black background and white icons', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const SizedBox(),
          bottomNavigationBar: FloatingBottomNav(
            currentIndex: 0,
            onTap: _noop,
            items: const [
              FloatingBottomNavItem(icon: Icons.home),
              FloatingBottomNavItem(icon: Icons.search),
            ],
          ),
        ),
      ),
    );

  // Find the Material with black color within the nav
  final navFinder = find.byType(FloatingBottomNav);
  final materialFinder = find.descendant(of: navFinder, matching: find.byType(Material));
  final materials = tester.widgetList<Material>(materialFinder);
  expect(materials.any((m) => m.color == Colors.black), true);

  // Verify IconButtons use white or near-white color
  final buttons = tester.widgetList<IconButton>(find.descendant(of: navFinder, matching: find.byType(IconButton)));
  expect(buttons.isNotEmpty, true);
  expect(buttons.any((b) => b.color == Colors.white || b.color == const Color(0xCCFFFFFF)), true);
  });
}

void _noop(int _) {}
