import 'package:flutter/material.dart';

class EmptyStateSection extends StatelessWidget {
  const EmptyStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google__icon-r.png',
              height: 100,
              width: 100,
            ),
            // Empty box illustration with background
            // Container(
            //   width: 160,
            //   height: 160,
            //   decoration: BoxDecoration(
            //     color: Colors.blue.withOpacity(0.1),
            //     shape: BoxShape.circle,
            //   ),
            //   child: CustomPaint(
            //     // painter: EmptyBoxPainter(),
            //     size: const Size(120, 120),
            //   ),
            // ),
            const SizedBox(height: 16),
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
    );
  }
}
