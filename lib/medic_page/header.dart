import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/medic_page/alert_dialog.dart';
import 'package:flutter/material.dart';

class MedicHeader extends StatelessWidget {
  const MedicHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Harry!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '5 Medicines Left',
                style: TextStyle(
                  fontSize: 14,
                  color: ChikitsaColors.black,
                ),
              ),
            ],
          ),
          AlertDialogBox(),
        ],
      ),
    );
  }
}
