import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/common_widgets/circular_loading_indicator.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/core/utils/values/image_path.dart';
import 'package:wheather_forcast_app/modules/home/home_controller.dart';
import 'package:wheather_forcast_app/modules/home/widgets/weather_widget.dart';

import '../../core/utils/values/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePath.homePageBg), fit: BoxFit.cover),
        ),
        child: Obx(() {
          switch (_homeController.responseStatus.resType) {
            case ResponseType.loading:
              return const CircularLoadingIndecator(
                indicatorColor: ConstColors.whiteColor,
              );
            case ResponseType.success:
              return const WeatherWidget();
            case ResponseType.error:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _homeController.responseStatus.msg ?? "",
                      style: context.openSansSemiBold.copyWith(
                          color: ConstColors.whiteColor, fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 35.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.r)),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ConstColors.whiteColor,
                            )),
                        onPressed: _homeController.fetchCurrentWeather,
                        child: Text(
                          ConstStrings.retry,
                          style: context.openSansMedium.copyWith(
                              fontSize: 15.sp, color: ConstColors.blackColor),
                        ),
                      ),
                    )
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}
