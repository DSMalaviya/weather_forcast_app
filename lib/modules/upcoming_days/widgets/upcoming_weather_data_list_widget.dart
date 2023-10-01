import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_controller.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/widgets/upcoming_weather_data_tile.dart';

class UpcomingWeatherDataList extends StatefulWidget {
  const UpcomingWeatherDataList({super.key});

  @override
  State<UpcomingWeatherDataList> createState() =>
      _UpcomingWeatherDataListState();
}

class _UpcomingWeatherDataListState extends State<UpcomingWeatherDataList> {
  late final _upcomingDaysWeatherController =
      Get.find<UpcomingDaysController>();
  @override
  Widget build(BuildContext context) {
    var weatherForcastDataMap =
        _upcomingDaysWeatherController.weatherForcastDataMap;
    if (weatherForcastDataMap.isEmpty) {
      return Center(
        child: Text(
          ConstStrings.noDataFound,
          style: context.openSansSemiBold
              .copyWith(fontSize: 17.sp, color: ConstColors.blackColor),
        ),
      );
    }
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          top: 10.h, bottom: 10.h + Get.mediaQuery.viewPadding.bottom),
      itemBuilder: (context, index) {
        var weatherData = weatherForcastDataMap.values.toList()[index].first;
        var weatherForcastDataKey = weatherForcastDataMap.keys.toList()[index];
        return UpcomingWeatherDataTile(
          weatherData: weatherData,
          weatherFocastDataKey: weatherForcastDataKey,
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 1.h,
              width: double.infinity,
              color: ConstColors.greyTextColor.withOpacity(.5),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        );
      },
      itemCount: weatherForcastDataMap.values.length,
    );
  }
}
