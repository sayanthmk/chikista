import 'package:flutter/material.dart';

class MedicHeader extends StatelessWidget {
  const MedicHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Harry!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '5 Medicines Left',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                // decoration: BoxDecoration(
                //   color: Colors.blue.shade100,
                //   borderRadius: BorderRadius.circular(8),
                // ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 32),
                                const Text(
                                  'Your Device is not\nconnected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 28),

                                // Custom robot illustration
                                // SizedBox(
                                //   height: 120,
                                //   width: 120,
                                //   child: CustomPaint(
                                //     painter: RobotPainter(), // Your custom painter
                                //   ),
                                // ),

                                const SizedBox(height: 24),
                                const Text(
                                  'Connect your device with',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 16),

                                // Connection Options
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Icon(Icons.bluetooth,
                                              color: Colors.white, size: 24),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Icon(Icons.wifi,
                                              color: Colors.white, size: 24),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.medical_services_rounded,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.orange,
                // backgroundImage:
                //     const NetworkImage('https://via.placeholder.com/150'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
