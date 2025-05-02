import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class CareTakerSection extends StatelessWidget {
  const CareTakerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ChikitsaColors.shadeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CareTakers(name: 'Dipa Luna'),
          const CareTakers(name: 'Roz Sodado'),
          const CareTakers(name: 'Sunny Tunis'),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CareTakers extends StatelessWidget {
  final String name;
  const CareTakers({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade700,
          child: ClipOval(
            child: Image.asset(
              'assets/tst.jpeg',
              fit: BoxFit.cover,
              width: 48,
              height: 48,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.person, color: Colors.grey.shade300);
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
