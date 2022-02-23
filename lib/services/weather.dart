import 'location.dart';
import 'networking.dart';
import '../auth/secrets.dart';

const String apiKey = OpenWeatherAPIKey;
const String OpenWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';
const String weatherUnits = 'metric';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude ?? 35.9617;
    double longitude = location.longitude ?? -83.9232;

    NetworkHelper networkHelper = NetworkHelper(
        '$OpenWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=$weatherUnits');

    var weatherData = await networkHelper.getData();

    return weatherData;
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
