import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_wind_speed.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_controller.dart';
import 'package:wheather_forcast_app/modules/home/widgets/grey_divider_widget.dart';
import 'package:wheather_forcast_app/modules/home/widgets/weather_widget_bottom_section.dart';

class ForcastDetailBottomSection extends StatefulWidget {
  const ForcastDetailBottomSection({super.key});

  @override
  State<ForcastDetailBottomSection> createState() =>
      _ForcastDetailBottomSectionState();
}

class _ForcastDetailBottomSectionState
    extends State<ForcastDetailBottomSection> {
  late final _forcastDetailController = Get.find<ForcastDetailController>();
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
                        var weatherList = _forcastDetailController
                            .selectedWeatherData.weather;
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
                          "${_forcastDetailController.selectedWeatherData.main?.humidity} %",
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
                          "${metersPerSecondToKilometersPerHour(_forcastDetailController.selectedWeatherData.wind?.speed ?? 0.0).toStringAsFixed(2)} ${ConstStrings.kmh}",
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
                          "${_forcastDetailController.selectedWeatherData.main?.pressure} ${ConstStrings.hpa}",
                          style: context.openSansBold.copyWith(
                              fontSize: 23.sp, color: ConstColors.blackColor),
                        );
                      })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
