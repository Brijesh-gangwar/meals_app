import 'package:flutter/material.dart';


class meal_item_traits extends StatelessWidget {
  const meal_item_traits({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
