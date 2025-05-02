import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class CountPage extends StatelessWidget {
  const CountPage({
    super.key,
  });

  final int totalCount = 1;
  final double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: ChikitsaColors.primaryColor,
                  inactiveTrackColor: Colors.grey[200],
                  thumbColor: ChikitsaColors.primaryColor,
                  trackHeight: 3,
                ),
                child: Slider(
                  min: 1,
                  max: 100,
                  value: sliderValue,
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  totalCount.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('01', style: TextStyle(color: Colors.grey)),
            Text('100', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
