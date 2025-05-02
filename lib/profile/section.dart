import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  const LinkText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SectionMainTile extends StatelessWidget {
  final String title;
  const SectionMainTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ChikitsaColors.black),
      ),
    );
  }
}
