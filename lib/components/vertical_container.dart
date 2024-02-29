import 'package:flutter/material.dart';
import 'package:global_current_weather/components/basic_container.dart';

class VerticalContainer extends StatelessWidget {
  final String label, value;
  final String imagePath;

  const VerticalContainer(
      {
        super.key,
        required this.label,
        required this.value,
        required this.imagePath
      }
  );

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
