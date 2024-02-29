import 'package:flutter/material.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';

class CurrentTempWidget extends StatelessWidget {
  const CurrentTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/weather/${SharedPrefs.getIcon()}.png',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Image.asset(
                  'assets/icons/temp.png',
                  width: 60,
                  height: 60,
                ),
              ),
              Text(
                SharedPrefs.getCurrentTemp(),
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
              Builder(
                builder: (context) => Text(
                  '°C',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Feels ${SharedPrefs.getFeels()}°C",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Min ${SharedPrefs.getMinTemp()}°C",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Max ${SharedPrefs.getMaxTemp()}°C",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
