import 'dart:developer';

import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/helpers/response_status.dart';
import 'package:wheather_forcast_app/data/models/current_day_weather_model.dart';
import 'package:wheather_forcast_app/data/models/current_time_zone_model.dart';
import 'package:wheather_forcast_app/data/services/apis/api_handler.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_screen.dart';

class HomeController extends GetxController {
  late final _apiProvider = Get.find<ApiProvider>();
  final Rx<ResponseStatus> _responseStatus = ResponseStatus.loading().obs;
  final Rx<CurrentDayWeatherModel> _currentDayWeatherData =
      CurrentDayWeatherModel().obs;
  final Rx<CurrentTimezoneModel> _currentTimeZoneData =
      CurrentTimezoneModel().obs;

  final Rx<String> _currentSelectedLocation = "Surat".obs;

  set currentSelectedLocation(String value) {
    _currentSelectedLocation(value);
  }

  fetchCurrentWeather() async {
    try {
      _responseStatus(ResponseStatus.loading());
      _currentDayWeatherData.value =
          await _apiProvider.fetchWeatherReportForDay(currentSelectedLocation);
      if (currentDayWeatherData.coord != null &&
          currentDayWeatherData.dt != null) {
        _currentTimeZoneData.value =
            await _apiProvider.fetchTimezoneOfSelactedLocation(
                latitude: currentDayWeatherData.coord?.lat?.toString() ?? "",
                longitude: currentDayWeatherData.coord?.lon?.toString() ?? "",
                timeStamp: currentDayWeatherData.dt?.toString() ?? "");
        _responseStatus(ResponseStatus.sucess());
      }
    } catch (e) {
      _responseStatus(ResponseStatus.error(errormsg: e.toString()));
      log(e.toString());
    }
  }

  showUpComingDaysWeatherData() {
    Get.toNamed(UpcomingDaysScreen.routeName,
        arguments: {"location": currentSelectedLocation});
  }

  @override
  void onInit() {
    super.onInit();
    fetchCurrentWeather();
  }

  String get currentSelectedLocation => _currentSelectedLocation.value;
  CurrentDayWeatherModel get currentDayWeatherData =>
      _currentDayWeatherData.value;
  CurrentTimezoneModel get currentTimeZoneData => _currentTimeZoneData.value;
  ResponseStatus get responseStatus => _responseStatus.value;
}
