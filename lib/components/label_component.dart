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
        Icon(icon, color: const Color.fromRGBO(97, 137, 255, 1)),
        const SizedBox(width: 12.0), // Add spacing
        Text(
          text,
          style: TextStyle(
            color:Colors.black87,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ), // Larger text
        ),
      ],
    );
  }
}
