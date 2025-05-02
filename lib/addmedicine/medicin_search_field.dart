import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class MedicinSearchField extends StatelessWidget {
  const MedicinSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Medicine Name',
        prefixIcon: const Icon(Icons.search, color: ChikitsaColors.grey),
        suffixIcon: const Icon(Icons.mic, color: ChikitsaColors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
