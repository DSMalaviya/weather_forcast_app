import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_time_stamp_to_dt.dart';
import 'package:wheather_forcast_app/core/utils/helpers/response_status.dart';
import 'package:wheather_forcast_app/data/models/weather_forcast_model.dart';
import 'package:wheather_forcast_app/data/services/apis/api_handler.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_screen.dart';

class UpcomingDaysController extends GetxController {
  late final _apiProvider = Get.find<ApiProvider>();
  final Rx<ResponseStatus> _responseStatus = ResponseStatus.loading().obs;
  final Rx<WeatherForcastModel> _weatherForcastData = WeatherForcastModel().obs;

  final Rx<String> _currentSelectedLocation = "".obs;

  final Rx<Map<String, List<WeatherData>>> _weatherForcastDataMap =
      Rx(<String, List<WeatherData>>{});

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      _currentSelectedLocation.value = arguments['location'] ?? "";
    }
    fetchNext5DaysWeather();
  }

  fetchNext5DaysWeather() async {
    try {
      _responseStatus(ResponseStatus.loading());
      _weatherForcastData.value =
          await _apiProvider.fetchWeatherForcast(currentSelectedLocation);
      //clear previous entries for safty
      // add each entry to map and the key is date time formatted
      _weatherForcastDataMap.value.clear();
      weatherForcastData.list?.forEach(
        (element) {
          DateTime currentSlotTime = convertTimeStampToDT(element.dt ?? 0);
          String formattedCurrentSlotTime =
              DateFormat.yMd().format(currentSlotTime);
          if (_weatherForcastDataMap.value
              .containsKey(formattedCurrentSlotTime)) {
            _weatherForcastDataMap.update((val) {
              val?[formattedCurrentSlotTime]?.add(element);
            });
          } else {
            _weatherForcastDataMap.update((val) {
              // val?.assign(formattedCurrentSlotTime, [element]);
              val?[formattedCurrentSlotTime] = [element];
            });
          }
        },
      );

      _responseStatus(ResponseStatus.sucess());
    } catch (e) {
      _responseStatus(ResponseStatus.error(errormsg: e.toString()));
    }
  }

  goToWeatherForcastDetailPage(String dateKey) {
    Get.toNamed(ForcastDetailScreen.routeName, arguments: {
      "forcast_data": weatherForcastDataMap[dateKey],
      "location_name": currentSelectedLocation
    });
  }

  String get currentSelectedLocation => _currentSelectedLocation.value;
  WeatherForcastModel get weatherForcastData => _weatherForcastData.value;
  ResponseStatus get responseStatus => _responseStatus.value;
  Map<String, List<WeatherData>> get weatherForcastDataMap =>
      _weatherForcastDataMap.value;
}
