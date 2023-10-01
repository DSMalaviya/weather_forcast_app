import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wheather_forcast_app/core/utils/values/const_colors.dart';
import 'package:wheather_forcast_app/data/services/apis/api_handler.dart';
import 'package:wheather_forcast_app/modules/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheather_forcast_app/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
          getPages: AppPages.pages,
          initialRoute: HomeScreen.routeName,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', "US"),
          theme: ThemeData.light()
              .copyWith(scaffoldBackgroundColor: ConstColors.whiteColor),
        );
      },
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiProvider());
  }
}
