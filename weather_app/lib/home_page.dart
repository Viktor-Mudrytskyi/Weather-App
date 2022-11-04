import 'package:flutter/material.dart';
import 'package:wheather_app/additional_info.dart';
import 'package:wheather_app/search_screen.dart';
import 'package:wheather_app/weather_client.dart';
import 'package:wheather_app/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});
  final String name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<WeatherModel>? weatherModel;

  @override
  void initState() {
    super.initState();
    weatherModel = WeatherClient(widget.name).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Weather At The Moment"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            SearchScreen()),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          future: weatherModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  space(15),
                  Text(
                    snapshot.data!.name!,
                    style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  space(20.0),
                  Image.network(
                    "http://openweathermap.org/img/wn/${snapshot.data!.icon}@4x.png",
                  ),
                  space(10.0),
                  Text(
                    "${snapshot.data!.temp!}°",
                    style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    "${snapshot.data!.min}°/${snapshot.data!.max}°",
                    style: const TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 15,
                    ),
                  ),
                  space(30),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    width: double.infinity,
                    child: const Text(
                      "Additional info",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  space(10),
                  AdditionalInfo(
                    feelslike: snapshot.data!.feelslike,
                    humidity: snapshot.data!.humidity,
                    pressure: snapshot.data!.pressure,
                    wind: snapshot.data!.wind,
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget space(double n) {
    return SizedBox(height: n);
  }
}
