import 'package:flutter/material.dart';

class EmptyStateSection extends StatelessWidget {
  const EmptyStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/empty_box.png',
                  height: 300,
                  width: 400,
                ),
                const Text(
                  'Nothing Is Here, Add a Medicine',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
