import 'package:flutter/material.dart';
import 'package:global_current_weather/widgets/top_widget.dart';
import 'package:global_current_weather/widgets/current_temp_widget.dart';
import 'package:global_current_weather/widgets/detail_widget.dart';
import 'package:global_current_weather/widgets/bottom_widget.dart';
import 'package:global_current_weather/widgets/update_widget.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';
import 'package:global_current_weather/utils/utils.dart';
import 'package:global_current_weather/api/api_call.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: Utils.getBackgroundGradient(SharedPrefs.getMainWeather())
        ),
        child: SharedPrefs.checkData()
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const TopWidget(),
              const CurrentTempWidget(),
              const DetailWidget(),
              const UpdateWidget(),
              BottomWidget(
                onRefresh: () async {
                  await getWeather();
                  setState(() {});
                },
              ),
            ],
          ),
        )
            : Center(
          child: BottomWidget(
            onRefresh: () async {
              setState(() {});
              await getWeather();
              setState(() {});
            },
            title: "Get Data",
          ),
        ),
      ),
    );
  }
}
