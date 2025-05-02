import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class MealTimeSelector extends StatelessWidget {
  MealTimeSelector({
    super.key,
  });

  final List<String> options = ['Before Food', 'After Food', 'Before Sleep'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          bool isFirst = option == options.first;

          return Container(
            margin: EdgeInsets.only(right: isFirst ? 2 : 2),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isFirst ? ChikitsaColors.primaryColor : Colors.transparent,
                foregroundColor: isFirst ? ChikitsaColors.black : Colors.black,
                elevation: 0,
                side: BorderSide(
                  color: isFirst ? Colors.transparent : Colors.grey[300]!,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(option),
            ),
          );
        }).toList(),
      ),
    );
  }
}
