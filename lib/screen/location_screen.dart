import 'package:flutter/material.dart';
import 'package:global_current_weather/utils/data.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';
import 'package:global_current_weather/api/api_call.dart';
import 'package:global_current_weather/widgets/update_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _temp = SharedPrefs.getCurrentTemp();

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredCities = List.from(cities);

  void _getData() {
    setState(() {});
    try {
      getWeather().then((_) {
        setState(() {
          _temp = SharedPrefs.getCurrentTemp();
        });
      });
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Card(
              color: Colors.indigo[900],
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(
                  SharedPrefs.getSelectedLocation(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                trailing: SharedPrefs.getSelectedLocation().isEmpty ? const Text('') : SharedPrefs.isLoading
              ? const CircularProgressIndicator() // Show loading indicator
              : _temp.isNotEmpty
                  ? Text('$_temp°C', style: const TextStyle(color: Colors.white, fontSize: 18)) // Show data
                  : ElevatedButton(
                      onPressed: _getData,
                      child: const Text('Sync'),
                    ),
              ),

            ),
          ),
          SharedPrefs.checkData() ?
            const Padding(
              padding:
              EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              child: UpdateWidget(),
            )
              :
            const SizedBox(
              height: 10,
            ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _filteredCities = cities
                          .where((city) =>
                          city['text'].toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search City',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ),
              ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _filteredCities.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _showCitySelectionDialog(context, _filteredCities[index]);
                    });
                  },
                  child: Card(
                    color: Colors.blue.shade700,
                    child: ListTile(
                      title: Text(
                        _filteredCities[index]['text'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showCitySelectionDialog(BuildContext context, Map<String, dynamic> value) async {
  /// Shows a dialog to confirm changing the selected city.
  ///
  /// The dialog displays a title, content, and two actions: "No" and "Yes".
  /// Tapping "Yes" will clear the current data and save the new city.
  ///
  /// The [context] argument is required and must not be null.
  /// The [value] argument is the selected city data.
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Change City'),
        content: const Text("This will erase current data."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              /// Clears the current data and saves the new city.
              SharedPrefs.clearMainData();
              SharedPrefs.saveCities(value).then((_) {
                setState(() {
                  _temp = '';
                });
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}
}