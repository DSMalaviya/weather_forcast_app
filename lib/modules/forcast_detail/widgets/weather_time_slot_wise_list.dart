import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/common_widgets/custom_image_viwer.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_kelvin_to_cel.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_time_stamp_to_dt.dart';
import 'package:wheather_forcast_app/core/utils/values/api_endpoints.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/data/models/weather_forcast_model.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_controller.dart';

class WeatherTimeSlotWiseList extends StatelessWidget {
  const WeatherTimeSlotWiseList({
    super.key,
    required ForcastDetailController forcastDetailController,
  }) : _forcastDetailController = forcastDetailController;

  final ForcastDetailController _forcastDetailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 1.sw,
      child: ListView.separated(
        itemBuilder: (context, index) {
          WeatherData weatherData =
              _forcastDetailController.weatherDataList[index];

          var weatherList = weatherData.weather;
          return Obx(() {
            bool isSelected =
                _forcastDetailController.selectedWeatherData == weatherData;
            return GestureDetector(
              onTap: () {
                _forcastDetailController.newWeatherData = weatherData;
              },
              child: Column(
                children: [
                  Text(
                    getDateTimeInAmPm(weatherData.dt ?? 0).toLowerCase(),
                    style: isSelected
                        ? context.openSansSemiBold.copyWith(
                            color: ConstColors.whiteColor, fontSize: 14.sp)
                        : context.openSansMedium.copyWith(
                            color: ConstColors.whiteColor, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Container(
                      width: 65.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ConstColors.whiteColor
                            : ConstColors.whiteColor.withOpacity(.3),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (weatherList != null && weatherList.isNotEmpty)
                            CustomImageViewr(
                              imgLink:
                                  "${Endpoints.baseUrl}${Endpoints.imagePath}${weatherList.first.icon}",
                              height: 30.h,
                              width: 30.h,
                            ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                kelvinToCelsius(weatherData.main?.temp ?? 0.0)
                                    .toStringAsFixed(2),
                                style: context.openSansSemiBold.copyWith(
                                    color: isSelected
                                        ? ConstColors.blackColor
                                        : ConstColors.whiteColor,
                                    fontSize: 13.sp,
                                    height: 1),
                              ),
                              Text(
                                ConstStrings.degreeCel,
                                style: context.openSansSemiBold.copyWith(
                                    fontSize: 7.sp,
                                    color: isSelected
                                        ? ConstColors.blackColor
                                        : ConstColors.whiteColor,
                                    fontFeatures: const [
                                      FontFeature.superscripts()
                                    ]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 15.w,
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _forcastDetailController.weatherDataList.length,
      ),
    );
  }
}
