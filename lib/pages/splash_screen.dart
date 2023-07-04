import 'package:flutter/material.dart';
import 'package:weather_app/services/hourly_weather.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late HourlyWeather _hourlyWeather;
  List<WeatherHourly> weatherHourly = [];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    final service = WeatherApi();
    final hourlyWeather = await service.getData();

    setState(() {
      _hourlyWeather = hourlyWeather;
        for(var i = 0; i < 8; i++) {
          weatherHourly.add(WeatherHourly(
            time: _hourlyWeather.time[i],
            temp: _hourlyWeather.temp[i],
            weatherCast: _hourlyWeather.weatherCast[i],
          ));
        }
    });

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': _hourlyWeather.location,
        'date': _hourlyWeather.date,
        'temp': _hourlyWeather.temp,
        'weather': _hourlyWeather.weather,
        'time' : _hourlyWeather.time,
        'wind' : _hourlyWeather.wind,
        'humidity' : _hourlyWeather.humidity,
        'rain' : _hourlyWeather.rain,
        'weatherHourly': weatherHourly
      }
      );
    }
  }
    @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.blue,
        child: const Center(
          child: SpinKitFoldingCube(
            color: Colors.red,
            size: 90,
          ),
        ),
      );
    }

}