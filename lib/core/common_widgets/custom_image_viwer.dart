import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';

class CustomImageViewr extends StatelessWidget {
  final String imgLink;
  final double height;
  final double width;
  final double? borderRadius;

  const CustomImageViewr(
      {Key? key,
      required this.imgLink,
      required this.height,
      required this.width,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      child: CachedNetworkImage(
        imageUrl: imgLink,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer(
          child: Container(
            height: height,
            width: width,
            color: ConstColors.transperntColor,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          color: ConstColors.transperntColor,
          child: Center(
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 28.h,
            ),
          ),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
