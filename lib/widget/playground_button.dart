import 'package:flutter/material.dart';

class PlaygroundButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const PlaygroundButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText),
             )
            ),
          ),
        ],
      ),
    );
  }
}
