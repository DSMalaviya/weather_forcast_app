import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';

class GreyDividerWidget extends StatelessWidget {
  const GreyDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 1.h,
          width: double.infinity,
          color: ConstColors.greyTextColor.withOpacity(.5),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
