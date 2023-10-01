import 'package:get/get.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_controller.dart';

class UpcomingDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpcomingDaysController());
  }
}
