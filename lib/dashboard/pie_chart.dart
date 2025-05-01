import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class RingChartPage extends StatefulWidget {
  const RingChartPage({super.key});

  @override
  State<RingChartPage> createState() => _RingChartPageState();
}

class _RingChartPageState extends State<RingChartPage> {
  final Map<String, double> dataMap = {
    "Complete": 35,
    "In Progress": 25,
    "Pending": 20,
    "Cancelled": 15,
    "Overdue": 5,
  };

  @override
  Widget build(BuildContext context) {
    double chartSize = MediaQuery.of(context).size.width / 1.8;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background circle
            Container(
              width: chartSize,
              height: chartSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200, // Background ring color
              ),
            ),

            // Pie Chart on top
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 1200),
              chartRadius: chartSize,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
              ),
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
