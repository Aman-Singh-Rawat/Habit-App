import 'package:get/state_manager.dart';
import 'package:habitly/app/modules/account/screens/account_screen.dart';
import 'package:habitly/app/modules/home/screens/home_screen.dart';
import 'package:habitly/app/modules/mood_stat/screens/mood_stat_screen.dart';
import 'package:habitly/app/modules/my_habits/screens/my_habits_screen.dart';
import 'package:habitly/app/modules/report/screens/report_screen.dart';

class MainController extends GetxController {
  RxInt bottomNavIndex = 0.obs;

  final pages = [
    HomeScreen(),
    MoodStatScreen(),
    ReportScreen(),
    MyHabitsScreen(),
    AccountScreen(),
  ];

  void onBottomNavTap(int index) {
    bottomNavIndex.value = index;
  }
}
