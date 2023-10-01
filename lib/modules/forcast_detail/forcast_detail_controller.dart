import 'package:get/get.dart';
import 'package:wheather_forcast_app/data/models/weather_forcast_model.dart';

class ForcastDetailController extends GetxController {
  final RxList<WeatherData> _weatherDataList = RxList();
  final Rx<WeatherData> _selectedWeatherData = WeatherData().obs;
  final Rx<String> _locationName = "".obs;

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      _weatherDataList.addAll(arguments['forcast_data']);
      _locationName.value = arguments['location_name'] ?? "";
    }
  }

  List<WeatherData> get weatherDataList => _weatherDataList;
  WeatherData get selectedWeatherData => _selectedWeatherData.value;
  String get locationName => _locationName.value;
}
