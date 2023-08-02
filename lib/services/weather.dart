import 'package:climate_consultation/services/location.dart';
import 'package:climate_consultation/services/networking.dart';
import 'package:climate_consultation/utilies/constants.dart';

class Weather {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?units=metric&lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
