import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_theme.dart';
import 'package:habitly/app/modules/bindings/app_bindings.dart';
import 'package:habitly/app/routes/app_pages.dart';

class habitlyApp extends StatelessWidget {
  const habitlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBindings(),
          title: AppStrings.habitly,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.main,
          getPages: AppPages.pages,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
