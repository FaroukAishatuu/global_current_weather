import 'package:flutter/material.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';

class BottomWidget extends StatelessWidget {
  final VoidCallback onRefresh;
  final String? title;
  const BottomWidget({Key? key, required this.onRefresh, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SharedPrefs.isLoading ?
              const CircularProgressIndicator() // Show loading indicator
                  :
              OutlinedButton(
                onPressed: onRefresh,
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(color: Colors.white)),
                ),
                child: Text(
                  title ?? 'Refresh',
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const Text(
            'OpenWeather',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
