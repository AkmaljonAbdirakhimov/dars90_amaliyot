import 'package:dars90_amaliyot/core/app_secrets.dart';
import 'package:dars90_amaliyot/ui/weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  final dio = Dio();

  Future<WeatherModel> getWeather(String city) async {
    try {
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$weatherApiKey";
      final response = await dio.get(url);

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw (e.response?.data['message']);
    } catch (e) {
      rethrow;
    }
  }
}
