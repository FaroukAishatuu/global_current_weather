# Global Current Weather App

## Introduction:
The Global Current Weather app is an application designed to display Current Weather Data sourced from OpenWeatherMap. It consists of two screens, Weather and Location, both accessible via bottom navigation.

## Features

- Display current weather conditions including temperature, humidity, wind speed, and more from Weather API.
- Weather condition based app theme.
- Icons based on weather from API.
- User-friendly minimal interface.
- Error handling for API requests and network connectivity issues.

## Functionality:
### Weather Screen:
- **No Data Available:**
   - When no weather data is available, the screen displays a button to fetch weather data from the OpenWeatherMap API.

- **Data Available:**
   - Displays various weather parameters including city name, main weather condition, weather icon, temperature, feels like temperature, minimum temperature, maximum temperature, visibility, humidity, pressure, cloudiness, wind direction, wind speed, sunrise time, sunset time, last updated time.
   - Provides a refresh button to fetch the latest weather data.

### Location Screen:
- **Selected Location:**
   - By default, the selected location is London. Next to the selected location, there are two conditions:
     - When weather data is not yet available, a sync button is displayed to fetch the data.
     - When weather data is available, the screen displays the temperature and last updated time. This data is also displayed on the Weather screen.
   - The selected location is stored using SharedPreferences, establishing a relationship between location data and weather data.

- **Search Input:**
   - Includes an input field that filters the list of cities based on the user's search input.

- **City List:**
   - Displays a list of cities from around the world, along with their respective country names.
   - Clicking on a city opens a modal for confirmation. Selecting "Yes" deletes all data in SharedPreferences and updates the selected location.

## Design Rationale:
The app follows a bottom navigation pattern for easy access to Weather and Location screens. It utilizes SharedPreferences to store and manage the selected location, ensuring consistency between location data and weather data. The Weather screen dynamically adjusts its display based on the availability of weather data.

## Challenges and Future Improvements:
Challenges encountered during development included handling asynchronous data fetching, managing SharedPreferences efficiently. Error handling for failed API requests has been implemented to provide a seamless user experience even in adverse network conditions. Future improvements may include:

- Adding support for additional weather parameters or features.
- Add location permissions to acquire the user's latitude and longitude, enabling more accurate weather data retrieval based on the user's current location.


## Screenshots

<p float="center">
  <img src="https://i.ibb.co/rxwbPts/Screenshot-Weather-No-Data.png" width="18%" />
  <img src="https://i.ibb.co/Z2VZHcg/Screenshot-Weather-With-Data.png" width="18%" />
  <img src="https://i.ibb.co/bbxRqLW/Screenshot-Weather-With-Data-Chicago.png" width="18%" />
  <img src="https://i.ibb.co/tZF4Vtc/Screenshot-Location-No-Data.png" width="18%" />
  <img src="https://i.ibb.co/MN4cf4L/Screenshot-Location-Synced-Data.png" width="18%" />
</p>

## Getting Started

Before proceeding, ensure that you have Flutter installed on your system. If not, you can follow the official Flutter installation guide [here](https://docs.flutter.dev/get-started/install) to install Flutter.

Once Flutter is installed, follow these steps to get the app up and running:

- Clone the repository: `git clone https://github.com/FaroukAishatuu/global_current_weather.git`
- Install dependencies: `flutter pub get`
- Run the app: `flutter run`

Or if use Android Studio :

- Clone the repository: `git clone https://github.com/FaroukAishatuu/global_current_weather.git`
- Install dependencies: `flutter pub get`
- Ensure you have Android Studio installed with the Flutter plugin.
- Open the project in Android Studio.
- Click on the 'Run' button or use the shortcut `Shift + F10` to run the app.

This will launch the app on your connected device or emulator. Ensure that your device or emulator is properly set up and configured to run Flutter apps.

## Dependencies

- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Wraps platform-specific persistent storage for simple data.
- [Http](https://pub.dev/packages/http) - For making HTTP requests to the weather API.
- [Intl](https://pub.dev/packages/intl) - Internationalization and formatting of dates.

## Development Information:
- Developed and tested on Flutter version 3.16.9.
- Dart version used is 3.2.6.

## Note:
Please be aware that the availability of weather data from OpenWeatherMap API may vary and could sometimes result in data not being retrieved successfully. This could be due to API downtime or other factors beyond the control of the application.
