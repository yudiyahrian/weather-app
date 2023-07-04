import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:weather_app/services/hourly_weather.dart';

class WeatherApi {

  Future<HourlyWeather> getData() async {

      // make the request
      final url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=-6.385589&lon=106.830711&appid=ac21b0625b9e235447f5c01af915d91b&units=metric');
      var response = await http.get(url);

      // decode the json-formatted response.
      if (response.statusCode == 200) {
        final earlyData = convert.jsonDecode(response.body);
        var data = earlyData['list'] as List<dynamic>;
        var location = earlyData['city']['name'];
        final dataWithLocation = {
          'location': location,
          'data': data
        };

        return
          HourlyWeather.fromJson(dataWithLocation);
      } else {
        throw Exception('Failed to fetch hourly weather data');
      }
  }

}