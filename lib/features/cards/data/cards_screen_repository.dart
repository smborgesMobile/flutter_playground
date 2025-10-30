import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_playground/features/cards/models/screen_definition.dart';

class CardsScreenRepository {
  const CardsScreenRepository();

  Future<ScreenDefinition> fetchFromAssets() async {
    final jsonStr = await rootBundle.loadString('lib/assets/screens/cards_screen.json');
    final map = json.decode(jsonStr) as Map<String, dynamic>;
    return ScreenDefinition.fromJson(map);
  }
}
