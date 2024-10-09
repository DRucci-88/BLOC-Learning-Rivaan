// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPreassure;
  final double currentWindSpeed;
  final double currentHumidity;

  const WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPreassure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    double? currentPreassure,
    double? currentWindSpeed,
    double? currentHumidity,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPreassure: currentPreassure ?? this.currentPreassure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPreassure': currentPreassure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    // final currentTemp = currentWeatherData['main']['temp'];
    // final currentSky = currentWeatherData['weather'][0]['main'];
    // final currentPressure = currentWeatherData['main']['pressure'];
    // final currentWindSpeed = currentWeatherData['wind']['speed'];
    // final currentHumidity = currentWeatherData['main']['humidity'];

    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPreassure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPreassure: $currentPreassure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPreassure == currentPreassure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPreassure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}
