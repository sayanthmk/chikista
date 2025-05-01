import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int selectedDayIndex = 0;
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
            _buildTodaysReportCard(),
            const SizedBox(height: 16),
            _buildDashboardCard(),
            const SizedBox(height: 16),
            _buildHistorySection(),
            const SizedBox(height: 24),
            _buildTimeSection('Morning', '08:00 am', [
              MedicationItem(
                name: 'Calpol 500mg Tablet',
                instruction: 'Before Breakfast',
                day: 1,
                status: MedicationStatus.taken,
                color: Colors.purple.shade100,
                icon: Icons.water_drop,
              ),
              MedicationItem(
                name: 'Calpol 500mg Tablet',
                instruction: 'Before Breakfast',
                day: 27,
                status: MedicationStatus.missed,
                color: Colors.pink.shade100,
                icon: Icons.medication,
              ),
            ]),
            _buildTimeSection('Afternoon', '02:00 pm', [
              MedicationItem(
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Colors.black,
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTodaysReportCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today\'s Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildReportItem('5', 'Total', Colors.blue),
              _buildReportItem('3', 'Taken', Colors.blue),
              _buildReportItem('1', 'Missed', Colors.blue),
              _buildReportItem('1', 'Snoozed', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardCard() {
    double chartSize = MediaQuery.of(context).size.width / 1.9;
    final Map<String, double> dataMap = {
      "Complete": 35,
      "In Progress": 25,
      "Pending": 20,
      "Cancelled": 15,
      "Overdue": 5,
    };
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
          // PieChart(dataMap: {})
          // RingChartPage(),
          Container(
            height: 70,
            width: 70,
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 1200),
              chartRadius: chartSize,
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
          // SizedBox(
          //   width: 60,
          //   height: 60,
          //   child: CustomPaint(
          //     painter: DonutChartPainter(),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildHistorySection() {
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
                      radius: 20,
                      backgroundColor: index == selectedDayIndex
                          ? Colors.blue.shade400
                          : Colors.grey.shade200,
                      child: Text(
                        weekdayNumbers[index].toString(),
                        style: TextStyle(
                          color: index == selectedDayIndex
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );

                // return _buildDayCircle(weekdays[index], weekdayNumbers[index],
                //     index == selectedDayIndex);
              },
            ),
          ),
        ),
      ],
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
        statusIcon = Icons.notifications_active;
        statusLabel = 'Taken';
        statusColor = Colors.green;
        break;
      case MedicationStatus.missed:
        statusIcon = Icons.notifications_off;
        statusLabel = 'Missed';
        statusColor = Colors.red;
        break;
      case MedicationStatus.snoozed:
        statusIcon = Icons.notifications_paused;
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
            child: Icon(
              medication.icon,
              color: medication.color.withOpacity(0.8),
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
  final IconData icon;

  MedicationItem({
    required this.name,
    required this.instruction,
    required this.day,
    required this.status,
    required this.color,
    required this.icon,
  });
}


  // Widget _buildBottomNavBar() {
  //   return BottomAppBar(
  //     shape: const CircularNotchedRectangle(),
  //     notchMargin: 8,
  //     child: SizedBox(
  //       height: 60,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Expanded(
  //             child: IconButton(
  //               icon: const Icon(Icons.home, color: Colors.grey),
  //               onPressed: () {},
  //             ),
  //           ),
  //           const Spacer(),
  //           Expanded(
  //             child: IconButton(
  //               icon: const Icon(Icons.bar_chart, color: Colors.blue),
  //               onPressed: () {},
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // class DonutChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width, size.height) / 2;
//     const strokeWidth = 8.0;

//     // Draw background circle
//     final backgroundPaint = Paint()
//       ..color = Colors.grey.shade200
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

//     canvas.drawCircle(center, radius - strokeWidth / 2, backgroundPaint);

//     // Draw segments
//     final segmentPaints = [
//       Paint()
//         ..color = Colors.red.shade300
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = strokeWidth
//         ..strokeCap = StrokeCap.butt,
//       Paint()
//         ..color = Colors.green.shade300
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = strokeWidth
//         ..strokeCap = StrokeCap.butt,
//       Paint()
//         ..color = Colors.blue.shade300
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = strokeWidth
//         ..strokeCap = StrokeCap.butt,
//       Paint()
//         ..color = Colors.orange.shade300
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = strokeWidth
//         ..strokeCap = StrokeCap.butt,
//     ];

//     // Draw each segment (simplified here)
//     double startAngle = -pi / 2; // Start from top

//     final segments = [0.25, 0.35, 0.15, 0.25]; // Example segment proportions

//     for (int i = 0; i < segments.length; i++) {
//       final sweepAngle = 2 * pi * segments[i];
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
//         startAngle,
//         sweepAngle,
//         false,
//         segmentPaints[i],
//       );
//       startAngle += sweepAngle;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }


  // Widget _buildDayCircle(String day, int number, bool isSelected) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Text(
  //         day,
  //         style: TextStyle(
  //           fontSize: 12,
  //           color: Colors.grey.shade600,
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       CircleAvatar(
  //         radius: 20,
  //         backgroundColor:
  //             isSelected ? Colors.blue.shade400 : Colors.grey.shade200,
  //         child: Text(
  //           number.toString(),
  //           style: TextStyle(
  //             color: isSelected ? Colors.white : Colors.black,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }