import 'package:flutter/material.dart';
import 'package:global_current_weather/components/basic_container.dart';
import 'package:global_current_weather/components/horizontal_container.dart';
import 'package:global_current_weather/components/vertical_container.dart';
import 'package:global_current_weather/components/row_info.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          Expanded(
            child: BasicContainer(
              height: 170,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    InfoRow(
                      label: 'Visibility',
                      value: SharedPrefs.getVisibility(),
                    ),
                    InfoRow(
                      label: 'Humidity',
                      value: SharedPrefs.getHumidity(),
                    ),
                    InfoRow(
                      label: 'Pressure',
                      value: SharedPrefs.getPressure(),
                    ),
                    InfoRow(
                      label: 'Cloud',
                      value: SharedPrefs.getClouds(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                HorizontalContainer(
                  label: SharedPrefs.getWindDirection(),
                  value: SharedPrefs.getWindSpeed(),
                  imagePath: 'assets/icons/wind.png',
                ),
                Row(
                  children: [
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunrise',
                        value: SharedPrefs.getSunrise(),
                        imagePath: 'assets/icons/sunrise.png',
                      ),
                    ),
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunset',
                        value: SharedPrefs.getSunset(),
                        imagePath: 'assets/icons/sunset.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }
}
