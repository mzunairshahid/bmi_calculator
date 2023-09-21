import 'package:flutter/material.dart';

const labelText = TextStyle(
  fontSize: 25,
);

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labelText,
        ),
      ],
    );
  }
}
