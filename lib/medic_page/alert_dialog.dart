import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height * 0.45,
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
                          Image.asset(
                            'assets/robot.png',
                            height: 100,
                            width: 100,
                          ),
                          const Spacer(),
                          const Text(
                            'Connect your device with',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: ChikitsaColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Icon(Icons.bluetooth,
                                        color: Colors.white, size: 24),
                                  ),
                                ),
                                VerticalDivider(),
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
                color: ChikitsaColors.primaryColor),
          ),
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.orange,
          backgroundImage: AssetImage('assets/tst.jpeg'),
        ),
      ],
    );
  }
}
