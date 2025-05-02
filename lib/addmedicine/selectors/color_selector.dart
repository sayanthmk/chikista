import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
  });

  final Color selectedColor = const Color(0xFFF8B7D3);
  // final List<Color> colorSelectorColors = [
  //   const Color(0xFFF8B7D3),
  //   const Color(0xFFD4C1F9),
  //   const Color(0xFFFF9F9F),
  //   const Color(0xFFCBF5CB),
  //   const Color(0xFFFFD2A5),
  //   const Color(0xFFA5E1FF),
  //   const Color(0xFFFFF8A5),
  // ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(colorSelectorColors.length, (index) {
        return GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorSelectorColors[index],
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedColor == colorSelectorColors[index]
                    ? Colors.blue
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
        );
      }),
    );
  }
}
