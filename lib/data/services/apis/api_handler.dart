import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/values/api_endpoints.dart';
import 'package:wheather_forcast_app/core/utils/values/app_constants.dart';
import 'package:wheather_forcast_app/data/models/current_day_weather_model.dart';
import 'package:wheather_forcast_app/data/models/current_time_zone_model.dart';
import 'package:wheather_forcast_app/data/models/weather_forcast_model.dart';
import 'package:wheather_forcast_app/data/services/apis/dio_client.dart';
import 'package:dio/dio.dart' as dio;

class ApiProvider extends GetxService {
  late final DioClient _dioClient = DioClient(dio.Dio());

  Future<CurrentDayWeatherModel> fetchWeatherReportForDay(
      String searchQuery) async {
    try {
      dio.Response response = await _dioClient.get(Endpoints.currentDayWeather,
          queryParameters: {
            "q": searchQuery,
            "appid": AppConstants.openWeatherAppId
          });
      return CurrentDayWeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherForcastModel> fetchWeatherForcast(String searchQuery) async {
    try {
      dio.Response response = await _dioClient
          .get(Endpoints.next5DaysWeatherForcast, queryParameters: {
        "q": searchQuery,
        // "cnt": 5,
        "appid": AppConstants.openWeatherAppId,
      });
      return WeatherForcastModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CurrentTimezoneModel> fetchTimezoneOfSelactedLocation(
      {required String latitude,
      required String longitude,
      required String timeStamp}) async {
    try {
      dio.Response response = await _dioClient
          .get(Endpoints.getTimeZoneOfLocation, queryParameters: {
        "location": "$latitude,$longitude",
        "timestamp": timeStamp,
        "key": AppConstants.googleApiKey
      });
      return CurrentTimezoneModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
