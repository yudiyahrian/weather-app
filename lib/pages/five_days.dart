import 'package:flutter/material.dart';
import 'package:weather_app/services/colors.dart';
import 'package:weather_app/services/daily_weather.dart';

class FiveDays extends StatefulWidget {
  const FiveDays({Key? key}) : super(key: key);

  @override
  State<FiveDays> createState() => _FiveDaysState();
}

class _FiveDaysState extends State<FiveDays> {

  List<DailyWeather> dailyWeather = [
    DailyWeather(day: 'Today', date: '20, March', temp: '20', weatherCast: 'cloudy_cast.png'),
    DailyWeather(day: 'Tuesday', date: '21, March', temp: '19', weatherCast: 'rainy_cast.png'),
    DailyWeather(day: 'Wednesday', date: '22, March', temp: '28', weatherCast: 'sunny_cast.png'),
    DailyWeather(day: 'Thursday', date: '23, March', temp: '18', weatherCast: 'thunderstorm_cast.png'),
    DailyWeather(day: 'Friday', date: '24, March', temp: '20', weatherCast: 'cloudy_cast.png'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 25,
                          color: textWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Depok',
                    style: TextStyle(
                      color: textWhite,
                      fontFamily: 'Russo One',
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      size: 40,
                      color: textWhite,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 30, 30),
              child: Column(
                children: const [
                  Text(
                      '28',
                      style: TextStyle(
                        color: textWhite,
                        fontFamily: 'Russo One',
                        fontWeight: FontWeight.normal,
                        fontSize: 92,
                        decoration: TextDecoration.none,
                      )
                  ),
                  Text(
                      'Cloudy',
                      style: TextStyle(
                        color: textGrey,
                        fontFamily: 'Chakra Petch',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Container(
                height: 92,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/wind.png',
                          height: 25,
                          width: 25,
                        ),
                        const Text(
                            '10 m/s',
                            style: TextStyle(
                              color: textWhite,
                              fontFamily: 'Russo One',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )
                        ),
                        const Text(
                            'Wind',
                            style: TextStyle(
                              color: textGrey,
                              fontFamily: 'Chakra Petch',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/humidity.png',
                          height: 25,
                          width: 25,
                        ),
                        const Text(
                            '98%',
                            style: TextStyle(
                              color: textWhite,
                              fontFamily: 'Russo One',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )
                        ),
                        const Text(
                            'Humidity',
                            style: TextStyle(
                              color: textGrey,
                              fontFamily: 'Chakra Petch',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            )
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/rain.png',
                          height: 25,
                          width: 25,
                        ),
                        const Text(
                            '20%',
                            style: TextStyle(
                              color: textWhite,
                              fontFamily: 'Russo One',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )
                        ),
                        const Text(
                            'Rain',
                            style: TextStyle(
                              color: textGrey,
                              fontFamily: 'Chakra Petch',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: dailyWeather.length,
                        itemBuilder: (BuildContext context, index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                            child: Container(
                              height: 76,
                              decoration: BoxDecoration(
                                color: bgCast,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 88,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            dailyWeather[index].day,
                                            style: const TextStyle(
                                              color: textWhite,
                                              fontFamily: 'Russo One',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              decoration: TextDecoration.none,
                                            )
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          dailyWeather[index].date,
                                            style: const TextStyle(
                                              color: textGrey,
                                              fontFamily: 'Chakra Petch',
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      dailyWeather[index].temp,
                                      style: const TextStyle(
                                        color: textWhite,
                                        fontFamily: 'Russo One',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 38,
                                        decoration: TextDecoration.none,
                                      )
                                  ),
                                  Image.asset(
                                    'assets/${dailyWeather[index].weatherCast}',
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
