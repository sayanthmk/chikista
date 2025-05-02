import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class HistorySection extends StatelessWidget {
  HistorySection({
    super.key,
  });

  final int selectedDayIndex = 0;
  final List<String> weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
  final List<int> weekdayNumbers = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Check History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              6,
              (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      weekdays[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: index == selectedDayIndex
                          ? ChikitsaColors.primaryColor
                          : Colors.grey.shade100,
                      child: Text(
                        weekdayNumbers[index].toString(),
                        style: TextStyle(
                          color: index == selectedDayIndex
                              ? ChikitsaColors.white
                              : ChikitsaColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
