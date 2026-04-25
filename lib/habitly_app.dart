import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_theme.dart';
import 'package:habitly/app/modules/bindings/app_bindings.dart';
import 'package:habitly/app/routes/app_pages.dart';

import 'l10n/app_translations.dart';

class habitlyApp extends StatelessWidget {
  const habitlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            // ─── Translation setup (3 lines is all you need) ──────────
            translations: AppTranslations(),
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),

            // ──────────────────────────────────────────────────────────
            initialBinding: AppBindings(),
            title: AppStrings.habitly,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            getPages: AppPages.pages,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
          );
        },
      ),
    );
  }
}
