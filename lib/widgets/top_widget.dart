import 'package:flutter/material.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            SharedPrefs.getCity(),
            style: const TextStyle(
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            SharedPrefs.getDescription(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
