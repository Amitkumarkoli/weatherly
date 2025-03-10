class WeatherModel {
  final String location;
  final String condition;
  final double temperature;

  WeatherModel({required this.location, required this.condition, required this.temperature});

  String getWeatherImage(){
    if(condition.contains("Rain")) return "assets/rain.png";
    if(condition.contains("cloud")) return "assets/cloudy.png";
    return "assets/sunny.png";
  }
}