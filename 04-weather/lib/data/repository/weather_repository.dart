import 'dart:convert';

import 'package:weather/data/data_provider/weather_data_provider.dart';
import 'package:weather/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider _weatherDataProvider;

  WeatherRepository(this._weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final weatherData =
          await _weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
