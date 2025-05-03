import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/medic_page/day_item.dart';
import 'package:chikitsa/medic_page/empty_state.dart';
import 'package:chikitsa/medic_page/header.dart';
import 'package:flutter/material.dart';

class MedicationTrackerHomePage extends StatelessWidget {
  final PageController pageController = PageController();
  MedicationTrackerHomePage({super.key});

  final DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChikitsaColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MedicHeader(),
            const DateSection(),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      buildTimeSection('Morning', '08:00 am', [
                        MedicationItem(
                          name: 'Calpol 500mg Tablet',
                          instruction: 'Before Breakfast',
                          day: 1,
                          status: MedicationStatus.taken,
                          color: Colors.pink.shade100,
                        ),
                        MedicationItem(
                          name: 'Calpol 500mg Tablet',
                          instruction: 'Before Breakfast',
                          day: 27,
                          status: MedicationStatus.missed,
                          color: Colors.blue.shade100,
                        ),
                      ]),
                      buildTimeSection('Afternoon', '02:00 pm', [
                        MedicationItem(
                          name: 'Calpol 500mg Tablet',
                          instruction: 'After Food',
                          day: 1,
                          status: MedicationStatus.snoozed,
                          color: Colors.purple.shade100,
                        ),
                      ]),
                      buildTimeSection('Night', '09:00 pm', [
                        MedicationItem(
                          name: 'Calpol 500mg Tablet',
                          instruction: 'Before Sleep',
                          day: 3,
                          status: MedicationStatus.left,
                          color: Colors.red.shade100,
                        ),
                      ]),
                    ],
                  ),
                  const EmptyStateSection(),
                ],
              ),
            ),
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
      case MedicationStatus.left:
        statusIcon = Icons.notifications;
        statusLabel = 'Left';
        statusColor = Colors.grey;
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
            child: getMedicationIcon(medication),
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
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getMedicationIcon(MedicationItem medication) {
    IconData iconData;

    if (medication.color == Colors.pink.shade100) {
      iconData = Icons.opacity;
    } else if (medication.color == Colors.blue.shade100) {
      iconData = Icons.medication;
    } else if (medication.color == Colors.purple.shade100) {
      iconData = Icons.water_drop;
    } else {
      iconData = Icons.edit;
    }

    return Icon(
      iconData,
      color: ChikitsaColors.white,
    );
  }
}

enum MedicationStatus {
  taken,
  missed,
  snoozed,
  left,
}

class MedicationItem {
  final String name;
  final String instruction;
  final int day;
  final MedicationStatus status;
  final Color color;

  MedicationItem({
    required this.name,
    required this.instruction,
    required this.day,
    required this.status,
    required this.color,
  });
}
