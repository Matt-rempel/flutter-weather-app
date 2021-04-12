
class Weather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;

  Weather({this.temp, this.feelsLike, this.low, this.high, this.description, this.pressure, this.humidity, this.wind, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}

// {
// coord: {lon: -114.0853, lat: 51.0501}, 
// weather: [{id: 803, main: Clouds, description: broken clouds, icon: 04d}], 
// base: stations, 
// main: {temp: 14.56, feels_like: 12.54, temp_min: 12.78, temp_max: 16, pressure: 1000, humidity: 18}, 
// visibility: 10000, 
// wind: {speed: 8.75, deg: 290, gust: 14.92}, 
// clouds: {all: 75}, 
// dt: 1617831827, 
// sys: {type: 1, id: 989, country: CA, sunrise: 1617800260, sunset: 1617848317}, 
// timezone: -21600, 
// id: 5913490, 
// name: Calgary, 
// cod: 200
// }