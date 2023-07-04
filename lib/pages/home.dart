import 'package:flutter/material.dart';
import 'package:weather_app/services/colors.dart';
import 'package:weather_app/services/hourly_weather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PageController _pageController = PageController(viewportFraction: 0.6, initialPage: 0,);
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _page = _pageController.page!;
        setState(() {
        });
      }
    });
  }
  Map? data = {};
  List<WeatherHourly> nullPrevent = [
    WeatherHourly(time: '3:00 AM', temp: '0', weatherCast: '01d')
  ];

  @override
  Widget build(BuildContext context) {
    data = (data?.isNotEmpty ?? false) ? data : ModalRoute.of(context)!.settings.arguments as Map?;

    return Container(
      color: primaryColor,
      child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${data?['location']}',
                      style: const TextStyle(
                        color: textWhite,
                        fontFamily: 'Russo One',
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                        '${data?['date'][0]}',
                      style: const TextStyle(
                        color: textGrey,
                        fontFamily: 'Chakra Petch',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      )
                    ),
                  ]
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
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 30, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                      Text(
                          '${data?['temp'][0]}',
                        style: const TextStyle(
                          color: textWhite,
                          fontFamily: 'Russo One',
                          fontWeight: FontWeight.normal,
                          fontSize: 70,
                          height: 0.7,
                          decoration: TextDecoration.none,
                        ),
                      ),
                        const Text(
                            ' °C',
                          style: TextStyle(
                              color: textWhite,
                              fontFamily: 'Russo One',
                              fontWeight: FontWeight.normal,
                              fontSize: 40,
                              decoration: TextDecoration.none,
                            ),
                        ),
                      ]
                    ),
                    Text(
                        '${data?['weather']}',
                        style: const TextStyle(
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 30, 20),
                child: Container(
                  height: 139,
                  width: 158,
                  decoration: BoxDecoration(
                    color: bgCast,
                    image: DecorationImage(
                      image: AssetImage(
                          data?['weatherHourly'] != null
                          ? "assets/01/${data?['weatherHourly'][0].weatherCast}.png"
                          : "transparent.png"
                      )
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                      Text(
                          '${data?['wind']} m/s',
                        style: const TextStyle(
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
                      Text(
                          '${data?['humidity']}%',
                          style: const TextStyle(
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
                      Text(
                          '${data?['rain']}%',
                          style: const TextStyle(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 20, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Text(
                        'Today',
                        style: TextStyle(
                          color: textWhite,
                          fontFamily: 'Chakra Petch',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        )
                    ),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: textWhite,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
                // const SizedBox(width: 10),
                // const Text(
                //     'Tomorrow',
                //     style: TextStyle(
                //       color: textGrey,
                //       fontFamily: 'Chakra Petch',
                //       fontWeight: FontWeight.w300,
                //       fontSize: 16,
                //       decoration: TextDecoration.none,
                //     )
                // ),
                const SizedBox(width: 10),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                        Navigator.pushNamed(context, '/fiveDays');
                    },
                    child: const Text(
                        'Next 5 days',
                        style: TextStyle(
                          color: textGrey,
                          fontFamily: 'Chakra Petch',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 0, 20),
            child: SizedBox(
              height: 120,
              child: PageView.builder(
                padEnds: false,
                pageSnapping: false,
                controller: _pageController,
                itemCount: (data?['weatherHourly'].length ?? 0) ~/ 2 + (data?['weatherHourly'].length ?? 0) % 2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ItemBuilder(items: data?['weatherHourly'] ?? nullPrevent, index: index * 2)
                        ),
                        Expanded(
                            child: index * 2 + 1 >= data?['weatherHourly']?.length
                                ? const SizedBox(height: 20)
                                : ItemBuilder(
                                items: data?['weatherHourly'] ?? nullPrevent, index: index * 2 + 1)
                        ),
                      ],
                    ),
                  );
                }),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: Container(
          //     height: 300,
          //     decoration: BoxDecoration(
          //       color: secondaryColor,
          //       borderRadius: BorderRadius.circular(21)
          //     ),
          //     child: const Center(
          //       child: Text(
          //           'SAYA ANAK TARUNA BHAKTI',
          //         style: TextStyle(
          //           color: textWhite,
          //           fontFamily: 'Russo One',
          //           fontWeight: FontWeight.normal,
          //           fontSize: 25,
          //           decoration: TextDecoration.none,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    Key? key,
    required List<WeatherHourly> items,
    required this.index,
  })  : _items = items,
        super(key: key);

  final List<WeatherHourly> _items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 115,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _items[index].time,
            style: const TextStyle(
              color: textGrey,
              fontFamily: 'Chakra Petch',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              decoration: TextDecoration.none,
            ),
          ),
          Image.asset(
            'assets/01/${_items[index].weatherCast}.png',
            height: 40,
          ),
          Text(
            _items[index].temp,
            style: const TextStyle(
              color: textWhite,
              fontFamily: 'Russo One',
              fontWeight: FontWeight.normal,
              fontSize: 13,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}