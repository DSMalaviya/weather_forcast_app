import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/common_widgets/circular_loading_indicator.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_strings.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/core/utils/values/enums.dart';
import 'package:wheather_forcast_app/core/utils/values/icon_path.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/upcoming_days_controller.dart';
import 'package:wheather_forcast_app/modules/upcoming_days/widgets/upcoming_weather_data_list_widget.dart';

class UpcomingDaysScreen extends StatefulWidget {
  const UpcomingDaysScreen({super.key});

  static const String routeName = "/upcomingDaysScreen";

  @override
  State<UpcomingDaysScreen> createState() => _UpcomingDaysScreenState();
}

class _UpcomingDaysScreenState extends State<UpcomingDaysScreen> {
  late final _upcomingDaysWeatherController =
      Get.find<UpcomingDaysController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          1.sw,
          45.h,
        ),
        child: AppBar(
          elevation: 0,
          backgroundColor: ConstColors.whiteColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Padding(
                padding: EdgeInsets.all(3.h),
                child: SvgPicture.asset(IconPath.backArrow,
                    colorFilter: const ColorFilter.mode(
                        ConstColors.blackColor, BlendMode.srcIn)),
              )),
          title: Text(
            _upcomingDaysWeatherController.currentSelectedLocation,
            style: context.openSansBold
                .copyWith(fontSize: 20.sp, color: ConstColors.blackColor),
          ),
        ),
      ),
      body: SizedBox(
        child: Obx(() {
          switch (_upcomingDaysWeatherController.responseStatus.resType) {
            case ResponseType.loading:
              return const CircularLoadingIndecator(
                indicatorColor: ConstColors.blackColor,
              );
            case ResponseType.success:
              return const UpcomingWeatherDataList();
            case ResponseType.error:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _upcomingDaysWeatherController.responseStatus.msg ?? "",
                      style: context.openSansSemiBold.copyWith(
                          color: ConstColors.blackColor, fontSize: 17.sp),
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
                              (states) => ConstColors.blackColor,
                            )),
                        onPressed: () {
                          _upcomingDaysWeatherController
                              .fetchNext5DaysWeather();
                        },
                        child: Text(
                          ConstStrings.retry,
                          style: context.openSansMedium.copyWith(
                              fontSize: 15.sp, color: ConstColors.whiteColor),
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
