import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/report_page/diagram_section.dart';
import 'package:chikitsa/report_page/history_section.dart';
import 'package:chikitsa/report_page/today_report.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key});

  final int selectedDayIndex = 0;

  final List<String> weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];

  final List<int> weekdayNumbers = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChikitsaColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 16),
            const Text(
              'Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const TodaysReportCard(),
            const SizedBox(height: 16),
            PieChartSection(),
            const SizedBox(height: 16),
            HistorySection(),
            const SizedBox(height: 24),
            buildTimeSection('Morning', '08:00 am', [
              MedicationItem(
                preficon: Icons.abc,
                name: 'Calpol 500mg Tablet',
                instruction: 'Before Breakfast',
                day: 1,
                status: MedicationStatus.taken,
                color: Colors.purple.shade100,
                icon: Icons.water_drop,
              ),
              MedicationItem(
                preficon: Icons.abc,
                name: 'Calpol 500mg Tablet',
                instruction: 'Before Breakfast',
                day: 27,
                status: MedicationStatus.missed,
                color: Colors.pink.shade100,
                icon: Icons.medication,
              ),
            ]),
            buildTimeSection('Afternoon', '02:00 pm', [
              MedicationItem(
                preficon: Icons.abc,
                name: 'Calpol 500mg Tablet',
                instruction: 'After Food',
                day: 1,
                status: MedicationStatus.snoozed,
                color: Colors.purple.shade100,
                icon: Icons.water_drop,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildTimeSection(
      String title, String time, List<MedicationItem> medications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            '$title $time',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...medications.map((med) => buildMedicationCard(med)),
      ],
    );
  }

  Widget buildMedicationCard(MedicationItem medication) {
    IconData statusIcon;
    String statusLabel;
    Color statusColor;

    switch (medication.status) {
      case MedicationStatus.taken:
        statusIcon = Icons.notifications_none;
        statusLabel = 'Taken';
        statusColor = Colors.green;
        break;
      case MedicationStatus.missed:
        statusIcon = Icons.notifications_none;
        statusLabel = 'Missed';
        statusColor = Colors.red;
        break;
      case MedicationStatus.snoozed:
        statusIcon = Icons.notifications_none;
        statusLabel = 'Snoozed';
        statusColor = Colors.orange;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: medication.color,
            child: Icon(
              medication.icon,
              color: ChikitsaColors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      medication.instruction,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text(
                        'Day ${medication.day.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                statusIcon,
                color: statusColor,
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                statusLabel,
                style: const TextStyle(
                  fontSize: 12,
                  color: ChikitsaColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum MedicationStatus {
  taken,
  missed,
  snoozed,
}

class MedicationItem {
  final String name;
  final String instruction;
  final int day;
  final MedicationStatus status;
  final Color color;
  final IconData icon;
  final IconData preficon;

  MedicationItem({
    required this.name,
    required this.instruction,
    required this.day,
    required this.status,
    required this.color,
    required this.icon,
    required this.preficon,
  });
}
