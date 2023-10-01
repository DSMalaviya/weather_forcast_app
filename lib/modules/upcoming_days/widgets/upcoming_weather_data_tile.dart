import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/common_widgets/custom_image_viwer.dart';
import 'package:wheather_forcast_app/core/utils/functions/convert_time_stamp_to_dt.dart';
import 'package:wheather_forcast_app/core/utils/values/api_endpoints.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/core/utils/values/icon_path.dart';
import 'package:wheather_forcast_app/data/models/weather_forcast_model.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_controller.dart';

class UpcomingWeatherDataTile extends StatefulWidget {
  const UpcomingWeatherDataTile(
      {super.key,
      required this.weatherData,
      required this.weatherFocastDataKey});

  final WeatherData weatherData;
  final String weatherFocastDataKey;

  @override
  State<UpcomingWeatherDataTile> createState() =>
      _UpcomingWeatherDataTileState();
}

class _UpcomingWeatherDataTileState extends State<UpcomingWeatherDataTile> {
  late final UpcomingDaysController _upcomingDaysController =
      Get.find<UpcomingDaysController>();

  goToDetailPage() {
    _upcomingDaysController
        .goToWeatherForcastDetailPage(widget.weatherFocastDataKey);
  }

  @override
  Widget build(BuildContext context) {
    var weatherList = widget.weatherData.weather;
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                if (weatherList != null && weatherList.isNotEmpty)
                  CustomImageViewr(
                    imgLink:
                        "${Endpoints.baseUrl}${Endpoints.imagePath}${weatherList.first.icon}",
                    height: 40.h,
                    width: 40.h,
                  ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  dateInString(widget.weatherData.dt ?? 0),
                  style: context.openSansSemiBold
                      .copyWith(fontSize: 15.sp, color: ConstColors.blackColor),
                ),
                const Spacer(),
                IconButton(
                  onPressed: goToDetailPage,
                  icon: SvgPicture.asset(
                    IconPath.forwardArrowFilled,
                    height: 30.h,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
