import 'package:vaanilai/services/location.dart';
import 'package:vaanilai/services/networking.dart';

const apiKey = '672d14f70123e8e206449e402bd8070d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const oneCallWeatherURL =
    'https://api.openweathermap.org/data/2.5/onecall?lat=';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getEveningWeather() async {
    Location location = Location();
    await location
        .getCurrentLocation(); // This fetches the latitude and longitude values.

    // Construct the API endpoint using the obtained latitude and longitude values
    // Use oneCallWeatherURL to make the API call and handle the response
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&exclude=current,minutely,daily&hourly=48');
    var eveningWeatherData = await networkHelper.getData();
    return eveningWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
