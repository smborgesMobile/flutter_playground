import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/playground_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PlaygroundButton(
              buttonText: "Bloc",
              onPressed: () {
                Navigator.pushNamed(context, '/bloc-router');
              },
            ),
            PlaygroundButton(buttonText: "Feature 1", onPressed: () {}),
            PlaygroundButton(buttonText: "Feature 2", onPressed: () {}),
            PlaygroundButton(buttonText: "Feature 3", onPressed: () {}),
            PlaygroundButton(buttonText: "Feature 4", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
