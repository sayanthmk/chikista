import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/medic_page/day_item.dart';
import 'package:chikitsa/medic_page/empty_state.dart';
import 'package:chikitsa/medic_page/header.dart';
import 'package:flutter/material.dart';

class MedicationTrackerHomePage extends StatelessWidget {
  final PageController _pageController = PageController();
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
            // _buildDateSelector(),
            const DateSection(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildTimeSection('Morning', '08:00 am', [
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
                      _buildTimeSection('Afternoon', '02:00 pm', [
                        MedicationItem(
                          name: 'Calpol 500mg Tablet',
                          instruction: 'After Food',
                          day: 1,
                          status: MedicationStatus.snoozed,
                          color: Colors.purple.shade100,
                        ),
                      ]),
                      _buildTimeSection('Night', '09:00 pm', [
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

                  // _buildDayMedicationList("Day 1"),
                  // _buildDayMedicationList("Day 2"),
                  // _buildDayMedicationList("Day 3"),
                  EmptyStateSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSection(
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
        ...medications.map((med) => _buildMedicationCard(med)),
      ],
    );
  }

  Widget _buildMedicationCard(MedicationItem medication) {
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: medication.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _getMedicationIcon(medication),
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
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
            crossAxisAlignment: CrossAxisAlignment.end,
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

  Widget _getMedicationIcon(MedicationItem medication) {
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
      color: medication.color.withOpacity(0.8),
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



// void main() {
//   runApp(const MedicationTrackerApp());
// }

// class MedicationTrackerApp extends StatelessWidget {
//   const MedicationTrackerApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Medication Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//         ),
//       ),
//       home: const MedicationTrackerHomePage(),
//     );
//   }
// }
  // Widget _buildHeader() {
  //   return MedicHeader();
  // }

  // Widget _buildDateSelector() {
  //   return DateSection();
  // }

  // Widget _buildDayItem(String day, {required bool isSelected}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 6),
  //     child: Text(
  //       day,
  //       style: TextStyle(
  //         color: isSelected ? Colors.white : Colors.grey,
  //         fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
  //       ),
  //     ),
  //   );
  // }
    // child: ListView(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   children: [
              //     _buildTimeSection('Morning', '08:00 am', [
              //       MedicationItem(
              //         name: 'Calpol 500mg Tablet',
              //         instruction: 'Before Breakfast',
              //         day: 1,
              //         status: MedicationStatus.taken,
              //         color: Colors.pink.shade100,
              //       ),
              //       MedicationItem(
              //         name: 'Calpol 500mg Tablet',
              //         instruction: 'Before Breakfast',
              //         day: 27,
              //         status: MedicationStatus.missed,
              //         color: Colors.blue.shade100,
              //       ),
              //     ]),
              //     _buildTimeSection('Afternoon', '02:00 pm', [
              //       MedicationItem(
              //         name: 'Calpol 500mg Tablet',
              //         instruction: 'After Food',
              //         day: 1,
              //         status: MedicationStatus.snoozed,
              //         color: Colors.purple.shade100,
              //       ),
              //     ]),
              //     _buildTimeSection('Night', '09:00 pm', [
              //       MedicationItem(
              //         name: 'Calpol 500mg Tablet',
              //         instruction: 'Before Sleep',
              //         day: 3,
              //         status: MedicationStatus.left,
              //         color: Colors.red.shade100,
              //       ),
              //     ]),
              //   ],
              // ),