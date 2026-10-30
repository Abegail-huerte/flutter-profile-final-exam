import 'package:flutter/material.dart';

class Prelim extends StatelessWidget {
  const Prelim({super.key});

  Widget box(String label) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.lightBlue,
      alignment: Alignment.center,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Prelim Exam', style: TextStyle(color: Colors.lightBlue)),
            const SizedBox(height: 16),
            const Text('Abegail O. Huerte'),
            const SizedBox(height: 8),
            box('BOX 1'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                box('BOX 2'),
                const SizedBox(width: 15),
                box('BOX 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
