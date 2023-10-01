import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/core/utils/values/const_text_styles.dart';
import 'package:wheather_forcast_app/core/utils/values/icon_path.dart';
import 'package:wheather_forcast_app/core/utils/values/image_path.dart';
import 'package:wheather_forcast_app/modules/forcast_detail/forcast_detail_controller.dart';

class ForcastDetailScreen extends StatefulWidget {
  const ForcastDetailScreen({super.key});

  static const String routeName = "/forcastDetailScreen";

  @override
  State<ForcastDetailScreen> createState() => _ForcastDetailScreenState();
}

class _ForcastDetailScreenState extends State<ForcastDetailScreen> {
  late final _forcastDetailController = Get.find<ForcastDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    width: 10.w,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      IconPath.backArrow,
                      height: 18.h,
                      colorFilter: const ColorFilter.mode(
                          ConstColors.whiteColor, BlendMode.srcIn),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _forcastDetailController.locationName,
                    style: context.openSansBold.copyWith(
                        color: ConstColors.whiteColor, fontSize: 20.sp),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 25.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
