import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CircularLoadingIndecator extends StatelessWidget {
  const CircularLoadingIndecator({super.key, required this.indicatorColor});

  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 45.w,
        width: 45.w,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [indicatorColor],
        ),
      ),
    );
  }
}
