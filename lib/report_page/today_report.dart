import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

import 'report_item.dart';

class TodaysReportCard extends StatelessWidget {
  const TodaysReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReportItem(
                color: ChikitsaColors.primaryColor,
                label: 'Total',
                value: '5',
              ),
              ReportItem(
                color: ChikitsaColors.primaryColor,
                label: 'Taken',
                value: '3',
              ),
              ReportItem(
                color: ChikitsaColors.primaryColor,
                label: 'Missed',
                value: '1',
              ),
              ReportItem(
                color: ChikitsaColors.primaryColor,
                label: 'Snoozed',
                value: '1',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
