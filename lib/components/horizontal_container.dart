import 'package:flutter/material.dart';
import 'package:global_current_weather/components/basic_container.dart';

class HorizontalContainer extends StatelessWidget {
  final String label, value;
  final String imagePath;

  const HorizontalContainer(
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
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            Column(
              children: [
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
          ],
        ),
      ),
    );
  }
}
