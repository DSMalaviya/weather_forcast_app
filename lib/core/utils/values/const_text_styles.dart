import 'package:flutter/material.dart';

class CustomTextStyles {
  static const String openSans = "OpenSans";

  static TextStyle openSansMedium(BuildContext context) {
    return const TextStyle(
      fontFamily: openSans,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle openSansRegular(BuildContext context) {
    return const TextStyle(
      fontFamily: openSans,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle openSansBold(BuildContext context) {
    return const TextStyle(
      fontFamily: openSans,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle openSansSemiBold(BuildContext context) {
    return const TextStyle(
      fontFamily: openSans,
      fontWeight: FontWeight.w600,
    );
  }
}

extension CustomStyle on BuildContext {
  TextStyle get openSansMedium => CustomTextStyles.openSansMedium(this);
  TextStyle get openSansRegular => CustomTextStyles.openSansRegular(this);
  TextStyle get openSansBold => CustomTextStyles.openSansBold(this);
  TextStyle get openSansSemiBold => CustomTextStyles.openSansSemiBold(this);
}
