// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:global_current_weather/api/api_url.dart';

/// A class that provides weather information using the OpenWeatherMap API.
class ApiServices {
  /// Returns a Future that completes with a JSON object containing weather information for the specified city.
  Future<Map<String, dynamic>> getWeatherApi(String city) async {
    // ignore: prefer_typing_uninitialized_variables
    Map<String, dynamic> jsonData;
    try {
      // Print the URL to the console.
      print(weatherAppUrl(city));
      // Make a GET request to the OpenWeatherMap API.
      final response = await http.get(Uri.parse(weatherAppUrl(city))).timeout(const Duration(seconds: 20));
      // Parse the response body into a JSON object.
      jsonData = json.decode(response.body);
      // Print the JSON response to the console.
      print(jsonData);
    } on SocketException {
      // Throw an [InternetException] if there is no internet connection.
      throw InternetException('No Internet');
    } on http.ClientException {
      // Throw a [RequestTimeOut] if the request times out.
      throw RequestTimeOut('Request Timeout');
    } on Exception {
      // Throw a generic [Exception] if an unknown error occurs.
      throw Exception('Unknown Error');
    }
    return jsonData;
  }

  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
          'Error while Communication ${response.statusCode}',
        );
    }
  }
}

// ignore_for_file: unused_field
/// An abstract class that defines the exceptions thrown by the ApiServices class.
abstract class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);
}

/// An exception thrown when there is a problem fetching data.
class FetchDataException extends AppExceptions {
  FetchDataException([message]) : super('');
}

/// An exception thrown when there is no internet connection.
class InternetException extends AppExceptions {
  InternetException([message]) : super('');
}

/// An exception thrown when the request times out.
class RequestTimeOut extends AppExceptions {
  RequestTimeOut([message]) : super('');
}

/// An exception thrown when an unknown error occurs.
class ServerError extends AppExceptions {
  ServerError([message]) : super('');
}

/// An exception thrown when the URL is invalid.
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([message]) : super('');
}

