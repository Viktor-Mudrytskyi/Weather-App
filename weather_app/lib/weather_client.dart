import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:wheather_app/weather_model.dart';


class WeatherClient {

  String name;

  WeatherClient(this.name);

  Future<WeatherModel> getWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$name&appid=7d03e9436a5bfdb9326f137eab03a4f1&units=metric"));

    if (response.statusCode == 200) {
      print("Success");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return WeatherModel.fromJSON(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
