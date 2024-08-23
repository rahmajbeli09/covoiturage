import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;

  const Details({
    Key? key,
    required this.onTap,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
          ),
        ],
      ),
    );
  }
}
