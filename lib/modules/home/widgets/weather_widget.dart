import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/common_widgets/custom_image_viwer.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_kelvin_to_cel.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_time_stamp_to_dt.dart';
import 'package:wheather_forcast_app/core/utils/values/api_endpoints.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/core/utils/values/icon_path.dart';
import 'package:wheather_forcast_app/core/utils/values/image_path.dart';
import 'package:wheather_forcast_app/modules/home/home_controller.dart';
import 'package:wheather_forcast_app/modules/home/widgets/weather_widget_bottom_section.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImagePath.homePageBg), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.mediaQuery.viewPadding.top + 15.h,
            width: 1.sw,
          ),
          //top app bar
          Obx(
            () => Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                const Spacer(),
                Text(
                  _homeController.currentDayWeatherData.name ?? "",
                  style: context.openSansBold
                      .copyWith(color: ConstColors.whiteColor, fontSize: 20.sp),
                ),
                const Spacer(),
                InkWell(
                  onTap: _homeController.onSearchTap,
                  child: SvgPicture.asset(
                    IconPath.searchIcon,
                    height: 18.h,
                    colorFilter: const ColorFilter.mode(
                        ConstColors.whiteColor, BlendMode.srcIn),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          //
          //
          SizedBox(
            height: 30.h,
          ),
          Obx(() {
            var weatherList = _homeController.currentDayWeatherData.weather;
            if (weatherList != null && weatherList.isNotEmpty) {
              return CustomImageViewr(
                imgLink:
                    "${Endpoints.baseUrl}${Endpoints.imagePath}${weatherList.first.icon}",
                height: 40.h,
                width: 40.h,
              );
            }
            return const SizedBox();
          }),
          Obx(
            () => Text(
              dateInString(_homeController.currentDayWeatherData.dt),
              style: context.openSansSemiBold
                  .copyWith(fontSize: 29.sp, color: ConstColors.whiteColor),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Obx(
            () => Text(
              dateInFomattedTime(_homeController.currentDayWeatherData.dt),
              style: context.openSansSemiBold.copyWith(
                  fontSize: 15.sp, color: ConstColors.lightWhiteColor),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Obx(
            () => Text(
              "(${_homeController.currentTimeZoneData.timeZoneId ?? ''})",
              style: context.openSansSemiBold.copyWith(
                  fontSize: 10.sp, color: ConstColors.lightWhiteColor),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kelvinToCelsius(
                            _homeController.currentDayWeatherData.main?.temp ??
                                0.0)
                        .toStringAsFixed(2),
                    style: context.openSansSemiBold.copyWith(
                        color: ConstColors.whiteColor,
                        fontSize: 45.sp,
                        height: 1),
                  ),
                  Text(
                    ConstStrings.degreeCel,
                    style: context.openSansSemiBold.copyWith(
                        fontSize: 13.sp,
                        color: ConstColors.lightWhiteColor,
                        fontFeatures: const [FontFeature.superscripts()]),
                  )
                ],
              )),
          SizedBox(
            height: 8.h,
          ),
          Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${ConstStrings.feelsLike} ${kelvinToCelsius(_homeController.currentDayWeatherData.main?.feelsLike ?? 0.0).toStringAsFixed(2)}",
                    style: context.openSansSemiBold.copyWith(
                        color: ConstColors.lightWhiteColor,
                        fontSize: 12.sp,
                        height: 1),
                  ),
                  Text(
                    ConstStrings.degreeCel,
                    style: context.openSansSemiBold.copyWith(
                        fontSize: 5.sp,
                        color: ConstColors.lightWhiteColor,
                        fontFeatures: const [FontFeature.superscripts()]),
                  )
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: _homeController.showUpComingDaysWeatherData,
                    child: Text(
                      ConstStrings.next7Days,
                      style: context.openSansSemiBold.copyWith(
                          color: ConstColors.lightBlueTextColor,
                          fontSize: 12.sp),
                    )),
                SizedBox(width: 10.w)
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          //bottom section
          const Expanded(child: WeatherWidgetBottomSection())
        ],
      ),
    );
  }
}
