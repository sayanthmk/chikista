import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  TypeSelector({
    super.key,
  });

  final List<Map<String, dynamic>> types = [
    {'name': 'Tablet', 'icon': Icons.tablet},
    {'name': 'Capsule', 'icon': Icons.medication},
    {'name': 'Cream', 'icon': Icons.water_drop},
    {'name': 'Liquid', 'icon': Icons.local_drink},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: types.map((type) {
        return GestureDetector(
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  type['icon'],
                  color: const Color(0xFFF8B7D3),
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                type['name'],
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
