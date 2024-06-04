import 'package:flutter/material.dart';

class LabelComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;
  final FontWeight fontWeight;
  const LabelComponent({
    super.key,
    required this.text,
    required this.icon,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12.0), // Add spacing
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ), // Larger text
        ),
      ],
    );
  }
}
