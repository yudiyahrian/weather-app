import 'package:intl/intl.dart';

class HourlyWeather {
  late List date;
  late List time;
  late List temp;
  late String weather;
  late String wind;
  late String rain;
  late String humidity;
  late String location;
  late List weatherCast;
  // late String url;

  HourlyWeather({ required this.date, required this.time, required this.temp, required this.weather, required this.wind, required this.humidity, required this.rain, required this.location, required this.weatherCast });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {

    var data = json['data'] as List<dynamic>;
    List<String> times = [];
    List<String> dates = [];
    List<String> temperatures = [];
    List<String> weatherCasts = [];

    for(var i in data){
      var time = i['dt_txt'];
      // Convert string to DateTime object
      DateTime dateTime = DateTime.parse(time);
      // // Format DateTime object to desired string format
      String formattedTime = DateFormat.jm().format(dateTime);
      String formattedDate = DateFormat('dd MMMM, EEEE').format(dateTime);

      final temperature = i['main']['temp'].toString().substring(0,2);
      final weatherCast = i['weather'][0]['icon'];

      weatherCasts.add(weatherCast);
      times.add(formattedTime);
      dates.add(formattedDate);
      temperatures.add(temperature);
    }
    var weather = data[0]['weather'] as List<dynamic>;
    final weatherType = weather[0]['main'];
    final wind = data[0]['wind']['speed'].toString();
    final humidity = data[0]['main']['humidity'].toString();

    const double maxRain = 10.0; // Maximum amount of rain in millimeters
    final rain = data[0]['rain'] != null ? data[0]['rain']['3h'].toDouble() : 0.0;
    var rainPercentage = (rain / maxRain) * 100;
    final formattedRain = rainPercentage.toString();

    final location = json['location'];

    return HourlyWeather(
      date: dates,
      time: times,
      temp: temperatures,
      weather: weatherType,
      wind: wind,
      humidity: humidity,
      rain: formattedRain,
      location: location,
      weatherCast: weatherCasts,
    );
  }
}

class WeatherHourly {
  late String time;
  late String temp;
  late String weatherCast;

  WeatherHourly({ required this.time, required this.temp, required this.weatherCast });

}