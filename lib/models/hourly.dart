class Hourly {
  final int dt;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double dewPoint;
  final double uvi;
  final double visibility;
  final double wind;
  final String description;
  final String icon; 

  Hourly({this.dt, this.temp, this.feelsLike, this.pressure, this.dewPoint, this.uvi, this.visibility, this.wind, this.description, this.icon});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    
    return Hourly(
      dt: json['dt'].toInt(),
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'].toDouble(),
      dewPoint: json['dew_point'].toDouble(),
      uvi: json['uvi'].toDouble(),
      visibility: json['visibility'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}