import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:global_current_weather/utils/utils.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;
  static bool _isLoading = false;

  /// Getter for _isLoading
  static bool get isLoading => _isLoading;

  /// Setter for _isLoading
  static void setIsLoading(bool value) {
    _isLoading = value;
  }

  /// Initializes the shared preferences instance.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Clears all data from the shared preferences instance.
  static Future<void> clearSharedPreferences() async {
    await _prefs.clear();
  }

  /// Saves the selected location and value to the shared preferences instance.
  static Future<void> saveCities(Map<String, dynamic> cities) async {
    await _prefs.setString('selectedLocation', cities['text']);
    await _prefs.setString('selectedValue', cities['value']);
  }

  /// Returns the selected location from the shared preferences instance.
  static String getSelectedLocation() {
    return _prefs.getString('selectedLocation') ?? "London, England";
  }

  /// Returns the selected value from the shared preferences instance.
  static String getSelectedValue() {
    return _prefs.getString('selectedValue') ?? "London";
  }

  /// Saves the main data to the shared preferences instance.
  static Future<void> saveData(String data) async {
    await _prefs.setString('mainData', data);
  }

  /// Checks if there is main data saved in the shared preferences instance.
  static bool checkData() {
    bool data = false;
    if (_prefs.getString('mainData') != null) {
      data = true;
    } else {
      data = false;
    }
    return data;
  }

  /// Deletes all data stored in the mainData key in the shared preferences instance.
  static Future<void> clearMainData() async {
    await _prefs.remove("mainData");
  }

  /// Parses the JSON data stored in the shared preferences instance.
  /// Returns a Map containing the parsed JSON data or `null` if no data is found.
  static Map<String, dynamic>? _parseJsonData() {
    String jsonString = _prefs.getString('mainData') ?? '';
    if (jsonString.isNotEmpty) {
      return jsonDecode(jsonString);
    } else {
      return null;
    }
  }

  /// Returns the value associated with the given key from the shared preferences instance.
  /// Returns the value associated with the given key or `null` if no value is found.
  static dynamic _getData(String key) {
    Map<String, dynamic>? jsonData = _parseJsonData();
    if (jsonData != null && jsonData.containsKey(key)) {
      return jsonData[key];
    } else {
      return null;
    }
  }

  /// Returns the value for the given key from the first element of the weather list in the JSON data.
  static dynamic _getWeather(String key) {
    dynamic weatherData = _getData('weather');
    if (weatherData is List && weatherData.isNotEmpty) {
      return weatherData[0][key] ?? '';
    } else {
      return '';
    }
  }

  /// Returns the value for the given key from the main object in the JSON data.
  static dynamic _getMain(String key) {
    Map<String, dynamic>? jsonData = _parseJsonData();
    return jsonData != null && jsonData.containsKey('main') && jsonData['main'].containsKey(key)
        ? jsonData['main'][key].round().toString() : '';
  }

  /// Returns the value for the given key from the wind object in the JSON data.
  static dynamic _getWind(String key) {
    Map<String, dynamic>? jsonData = _parseJsonData();
    return jsonData!= null && jsonData.containsKey('wind') && jsonData['wind'].containsKey(key)
      ? jsonData['wind'][key].toString() : '';
  }

  /// Returns the value for the given key from the sys object in the JSON data.
  static dynamic _getSys(String key) {
    Map<String, dynamic>? jsonData = _parseJsonData();
    return jsonData!= null && jsonData.containsKey('sys') && jsonData['sys'].containsKey(key)
    ? jsonData['sys'][key].toString() : '';
  }


  /// Returns the value for the given key from the clouds object in the JSON data.
  static String getClouds() {
    Map<String, dynamic>? jsonData = _parseJsonData();
    return jsonData != null && jsonData.containsKey('clouds') && jsonData['clouds'].containsKey('all')
        ? '${jsonData['clouds']['all']} %' : '';
  }

  // Methods to get specific data
  static String getCity() => _getData('name') ?? '';
  static String getDescription() => _getWeather('description').toUpperCase() ?? '';
  static String getIcon() => _getWeather('icon') ?? '';
  static String getMainWeather() => _getWeather('main').toLowerCase() ?? '';
  static String getCurrentTemp() => _getMain('temp') ?? '';
  static String getFeels() => _getMain('feels_like') ?? '';
  static String getMinTemp() => _getMain('temp_min')?? '';
  static String getMaxTemp() => _getMain('temp_max')?? '';
  static String getPressure() => _getMain('pressure')+' hPa'?? '';
  static String getHumidity() => _getMain('humidity')+' %'?? '';
  static String getVisibility() => Utils.convertVisibility(_getData('visibility').toString());
  static String getWindSpeed() => Utils.convertSpeed(_getWind('speed'));
  static String getWindDirection() => Utils.getWindDirection(_getWind('deg'));
  static String getSunrise() => Utils.convertTimestampToTime(_getSys('sunrise'));
  static String getSunset() => Utils.convertTimestampToTime(_getSys('sunset'));
  static String getDtTime() => Utils.convertDtToTime(_getData('dt').toString());

}