import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartSection extends StatelessWidget {
  PieChartSection({
    super.key,
  });

  final Map<String, double> dataMap = {
    "Complete": 35,
    "In Progress": 25,
    "Pending": 20,
    "Cancelled": 15,
    "Overdue": 5,
  };

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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Here you will find everything related to your active and past medicines.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                ),
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: const Duration(milliseconds: 1200),
                  chartRadius: 200,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 10,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false,
                  ),
                  legendOptions: const LegendOptions(
                    showLegends: false,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
