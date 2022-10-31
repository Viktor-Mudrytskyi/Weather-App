import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final double? wind;
  final int? humidity;
  final double? feelslike;
  final int? pressure;

  const AdditionalInfo(
      {super.key, this.feelslike, this.humidity, this.pressure, this.wind});

  static const TextStyle textStyleWords = TextStyle(
    fontFamily: "Times New Roman",
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyleNumber = TextStyle(
    fontFamily: "Times New Roman",
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Wind",
                style: textStyleWords,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Humidity",
                style: textStyleWords,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$wind m/s",
                style: textStyleNumber,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$humidity%",
                style: textStyleNumber,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Pressure",
                style: textStyleWords,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Feels like",
                style: textStyleWords,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$pressure",
                style: textStyleNumber,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$feelslike°",
                style: textStyleNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
