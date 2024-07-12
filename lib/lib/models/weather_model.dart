class WeatherModel {
  final String cityname;
  final String date;
  final String image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String condition;

  WeatherModel({
    required this.cityname,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityname: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}