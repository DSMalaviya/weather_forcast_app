import 'package:get/get.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_controller.dart';

class ForcastDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForcastDetailController());
  }
}
