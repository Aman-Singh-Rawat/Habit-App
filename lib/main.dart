import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/modules/home/models/one_time_task.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:habitly/habitly_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:toastification/toastification.dart';

const String appFontFamily = 'Poppins';
const String latoFontFamily = 'lato';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initMain();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ToastificationWrapper(child: const habitlyApp()),
    ),
  );
}

Future<void> initMain() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  await Hive.initFlutter();


  //await Hive.deleteFromDisk();

  Hive.registerAdapter(RegularHabitAdapter());
  Hive.registerAdapter(OneTimeTaskAdapter());

  await Hive.openBox<RegularHabit>(strRegularHabits);
  await Hive.openBox<OneTimeTask>(strOneTimeTasks);
}
