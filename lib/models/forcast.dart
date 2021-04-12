

import 'package:weather/models/daily.dart';
import 'package:weather/models/hourly.dart';

class Forecast {
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast({this.hourly, this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> hourly = new List<Hourly>();
    List<Daily> daily = new List<Daily>();

    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    });
    
    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      daily.add(day);
    });
    
    return Forecast(
      hourly: hourly,
      daily: daily
    );
  }
}