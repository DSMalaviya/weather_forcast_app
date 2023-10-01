import 'package:get/get.dart';
import 'package:wheather_forcast_app/modules/home/home_binding.dart';
import 'package:wheather_forcast_app/modules/home/home_screen.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_binding.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_screen.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_binding.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: UpcomingDaysScreen.routeName,
      page: () => const UpcomingDaysScreen(),
      binding: UpcomingDaysBinding(),
    ),
    GetPage(
      name: ForcastDetailScreen.routeName,
      page: () => const ForcastDetailScreen(),
      binding: ForcastDetailBinding(),
    ),
  ];
}
