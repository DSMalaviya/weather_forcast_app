import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_time_stamp_to_dt.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_wind_speed.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/modules/home/home_controller.dart';
import 'package:wheather_forcast_app/modules/home/widgets/grey_divider_widget.dart';

class WeatherWidgetBottomSection extends StatefulWidget {
  const WeatherWidgetBottomSection({super.key});

  @override
  State<WeatherWidgetBottomSection> createState() =>
      _WeatherWidgetBottomSectionState();
}

class _WeatherWidgetBottomSectionState
    extends State<WeatherWidgetBottomSection> {
  late final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: ConstColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  WeatherDisplyTile(
                      label: ConstStrings.weather,
                      textWidget: Obx(() {
                        var weatherList =
                            _homeController.currentDayWeatherData.weather;
                        if (weatherList != null && weatherList.isNotEmpty) {
                          return Text(
                            (weatherList.first.main?.capitalize ?? ""),
                            style: context.openSansBold.copyWith(
                                fontSize: 23.sp, color: ConstColors.blackColor),
                          );
                        }
                        return const SizedBox();
                      })),
                  SizedBox(
                    width: 20.w,
                  ),
                  WeatherDisplyTile(
                      label: ConstStrings.humidity,
                      textWidget: Obx(() {
                        return Text(
                          "${_homeController.currentDayWeatherData.main?.humidity} %",
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                ],
              ),
            ),
            const GreyDividerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  WeatherDisplyTile(
                      label: ConstStrings.wind,
                      textWidget: Obx(() {
                        return Text(
                          "${metersPerSecondToKilometersPerHour(_homeController.currentDayWeatherData.wind?.speed ?? 0.0).toStringAsFixed(2)} km/h",
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                  SizedBox(
                    width: 20.w,
                  ),
                  WeatherDisplyTile(
                      label: ConstStrings.pressure,
                      textWidget: Obx(() {
                        return Text(
                          "${_homeController.currentDayWeatherData.main?.pressure} hPa",
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                ],
              ),
            ),
            const GreyDividerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  WeatherDisplyTile(
                      label: ConstStrings.sunrise,
                      textWidget: Obx(() {
                        return Text(
                          getDateTimeInAmPm(_homeController
                                  .currentDayWeatherData.sys?.sunrise ??
                              0),
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                  SizedBox(
                    width: 20.w,
                  ),
                  WeatherDisplyTile(
                      label: ConstStrings.sunset,
                      textWidget: Obx(() {
                        return Text(
                          getDateTimeInAmPm(_homeController
                                  .currentDayWeatherData.sys?.sunset ??
                              0),
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                ],
              ),
            ),
            SizedBox(
              height: 20.h + Get.mediaQuery.viewPadding.bottom,
            )
          ],
        ),
      ),
    );
  }
}

class WeatherDisplyTile extends StatelessWidget {
  const WeatherDisplyTile(
      {super.key, required this.label, required this.textWidget});

  final String label;
  final Widget textWidget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.openSansSemiBold
                .copyWith(fontSize: 14.sp, color: ConstColors.greyTextColor),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5.h,
          ),
          textWidget
        ],
      ),
    );
  }
}
