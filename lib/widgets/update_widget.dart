import 'package:flutter/material.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Last updated',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              Text(
                SharedPrefs.getDtTime(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
