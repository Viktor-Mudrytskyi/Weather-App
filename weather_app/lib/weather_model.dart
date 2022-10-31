class WeatherModel{
  String? name;
  double? temp;
  double? wind;
  int? humidity;
  double? feelslike;
  int? pressure;
  String? main;
  double? min;
  double? max;
  String? icon;

  WeatherModel();

  WeatherModel.fromJSON(Map<String,dynamic> json){
    name=json["name"];
    temp=json["main"]["temp"];
    wind=json["wind"]['speed'];
    humidity=json["main"]["humidity"];
    feelslike=json["main"]["feels_like"];
    pressure=json["main"]["pressure"];
    main=json["weather"][0]["main"];
    min=json["main"]["temp_min"];
    max=json["main"]["temp_max"];
    icon=json["weather"][0]["icon"];
  }
}