import 'package:flutter/material.dart';
import '../../../core/constants/voco_colors.dart';
import '../../../core/constants/voco_dimensions.dart';

/// This is the button we love. This is the button we use LITERALLY everywhere.
class VocoButton extends StatelessWidget {
  const VocoButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  /// The text for button's. (Give me a text and i'll show on the button.)
  final String text;

  /// PRESS ME, MASTER!
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(VocoColors.congressBlue),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: VocoDimensions.circularRadius,
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
