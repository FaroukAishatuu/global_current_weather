import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Utils {
  /// Returns a LinearGradient based on the given weatherMain string.
  static LinearGradient getBackgroundGradient(String weatherMain) {
    LinearGradient linearGradient;

    switch (weatherMain.toLowerCase()) {
      case 'clear':
      case 'snow':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue,
            Colors.indigoAccent,
          ],
        );
        break;
      case 'smoke':
      case 'haze':
      case 'squall':
      case 'tornado':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue,
            Colors.blueGrey,
          ],
        );
        break;
      case 'dust':
      case 'sand':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey,
            Colors.brown,
          ],
        );
        break;
      case 'fog':
      case 'mist':
      case 'ash':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue,
            Colors.white70
          ],
        );
        break;
      case 'clouds':
      case 'thunderstorm':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey,
            Colors.blueGrey,
          ],
        );
        break;
      case 'rain':
      case 'drizzle':
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.indigo,
          ],
        );
        break;
      default:
        linearGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.indigo,
          ],
        );
    }
    return linearGradient;
  }

  /// Returns a string representing the distance in kilometers from the given visibilityMeters input.
  static String convertVisibility(String visibilityMeters) {
    double visibilityKm = double.parse(visibilityMeters) / 1000.0;
    return '${visibilityKm.toStringAsFixed(0)} Km';
  }

  /// The function returns a string representing the distance in kilometers per hour.
  static String convertSpeed(String speedMetersPerSecond) {
    double speedKilometersPerHour = double.parse(speedMetersPerSecond) * 3.6;
    return '${speedKilometersPerHour.toStringAsFixed(0)} km/h';
  }

  /// Returns the wind direction in a given degrees as a string.
  static String getWindDirection(String degrees) {
    int degreesInt = int.tryParse(degrees) ?? 0;

    if (degreesInt >= 338 || degreesInt < 23) {
      return 'North';
    } else if (degreesInt >= 23 && degreesInt < 68) {
      return 'Northeast';
    } else if (degreesInt >= 68 && degreesInt < 113) {
      return 'East';
    } else if (degreesInt >= 113 && degreesInt < 158) {
      return 'Southeast';
    } else if (degreesInt >= 158 && degreesInt < 203) {
      return 'South';
    } else if (degreesInt >= 203 && degreesInt < 248) {
      return 'Southwest';
    } else if (degreesInt >= 248 && degreesInt < 293) {
      return 'West';
    } else {
      return 'Northwest';
    }
  }

  /// Returns a string representing the time formatted as "h:mm a" from the given timestamp input.
  static String convertTimestampToTime(String timestamp) {
    int timestampInt = int.tryParse(timestamp) ?? 0;
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInt * 1000);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  /// Returns a string representing the date and time formatted as "d MMMM y, h:mm a" from the given datetime input.
  static String convertDtToTime(String dt) {
    int dtInt = int.tryParse(dt) ?? 0;
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dtInt * 1000);
    final String formattedTime = DateFormat('d MMMM y, h:mm a').format(dateTime);
    return formattedTime;
  }
}
