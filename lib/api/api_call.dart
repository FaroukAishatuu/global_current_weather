import 'dart:convert';
import 'package:global_current_weather/api/api_service.dart';
import 'package:global_current_weather/utils/shared_prefs.dart';


/// Fetches the current weather data from the API and saves it to shared preferences.
Future<void> getWeather() async {
  try {
    /// Sets the loading state to true to indicate that the weather data is being retrieved.
    SharedPrefs.setIsLoading(true);
    final weatherData = await ApiServices().getWeatherApi(SharedPrefs.getSelectedValue());
    /// Converts the weather data to a JSON string and saves it to shared preferences.
    String jsonString = jsonEncode(weatherData);
    SharedPrefs.saveData(jsonString);
    /// Prints the weather data to the console for debugging purposes.
    print(jsonString);
  } catch (e) {
    /// Prints an error message if an error occurs while fetching the weather data.
    print('Error fetching weather data: $e');
  } finally {
    /// Sets the loading state to false to indicate that the weather data retrieval process is complete.
    SharedPrefs.setIsLoading(false);
  }
}
