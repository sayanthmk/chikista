import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class CompartmentSelector extends StatelessWidget {
  const CompartmentSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int selectedCompartment = 1;
    return Row(
      children: List.generate(7, (index) {
        if (index > 5) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }

        return Expanded(
          child: GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 48,
              decoration: BoxDecoration(
                color: selectedCompartment == index + 1
                    ? const Color(0xFFEEF2FF)
                    : Colors.white,
                border: Border.all(
                  color: selectedCompartment == index + 1
                      ? ChikitsaColors.primaryColor
                      : Colors.grey[300]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: selectedCompartment == index + 1
                        ? ChikitsaColors.primaryColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
