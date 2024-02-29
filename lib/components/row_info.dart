import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({Key? key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            Text(
              value.isNotEmpty ? value : 'N/A',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Divider(
            height: 10,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

