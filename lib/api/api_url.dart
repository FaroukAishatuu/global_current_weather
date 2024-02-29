/// A constant string containing the OpenWeatherMap API key.
const apiKey = '17c30017168f2fa1add6c6fbd64357a2';

/// Returns a URL for the Weather App, given a city.
String weatherAppUrl(var city) {
  /// A variable to hold the constructed URL.
  String url;

  /// Assigns the URL a value by concatenating the base URL with the city parameter.
  url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

  /// Returns the constructed URL.
  return url;
}