import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'cb602ec1df94571ca0a13775bc5d0254';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  static Future<dynamic> getCityWeather(String cityName) async {
    String url = '${openWeatherURL}q=$cityName&appid=$apiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  static Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    String url =
        '${openWeatherURL}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  static String getWeatherIcon(int condition) {
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

  static String getMessage(double temp) {
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
