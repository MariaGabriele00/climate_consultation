class WeatherModel {
  String? location, description, icon;
  dynamic temperature, tempMin, tempMax, humidity;

  WeatherModel({
    this.location,
    this.description,
    this.icon,
    this.temperature,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });
}
