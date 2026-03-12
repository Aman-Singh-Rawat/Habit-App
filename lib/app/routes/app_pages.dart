import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/modules/authentication/bindings/forgot_password_binding.dart';
import 'package:habitly/app/modules/authentication/bindings/sign_in_binding.dart';
import 'package:habitly/app/modules/authentication/bindings/signup_binding.dart';
import 'package:habitly/app/modules/authentication/bindings/welcome_binding.dart';
import 'package:habitly/app/modules/authentication/views/screens/forgot_your_password.dart';
import 'package:habitly/app/modules/authentication/views/screens/sign_in_screen.dart';
import 'package:habitly/app/modules/authentication/views/screens/signup_screen.dart';
import 'package:habitly/app/modules/authentication/views/screens/welcome_screen.dart';
import 'package:habitly/app/modules/bottom_nav/bindings/main_binding.dart';
import 'package:habitly/app/modules/bottom_nav/views/main_screen.dart';
import 'package:habitly/app/modules/home/bindings/create_new_habit_binding.dart';
import 'package:habitly/app/modules/home/screens/create_new_habit_screen.dart';
import 'package:habitly/app/modules/mood_stat/bindings/mood_stat_history_binding.dart';
import 'package:habitly/app/modules/mood_stat/screens/mood_stat_history_screen.dart';
import 'package:habitly/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:habitly/app/modules/onboarding/views/screens/onboarding_screen.dart';
import 'package:habitly/app/modules/splash/bindings/splash_bindings.dart';
import 'package:habitly/app/modules/splash/views/splash_screen.dart';
import 'package:habitly/app/modules/user_setup/bindings/achieve_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/contract_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/end_day_time_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/focus_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/influenced_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/procrastination_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/sleep_duration_binding.dart';
import 'package:habitly/app/modules/user_setup/bindings/wake_time_binding.dart';
import 'package:habitly/app/modules/user_setup/views/screens/achieve_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/contract_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/end_day_time_view_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/focus_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/influenced_you_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/procrastination_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/sleep_duration_screen.dart';
import 'package:habitly/app/modules/user_setup/views/screens/wake_time_view.dart';

class AppPages {
  const AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotYourPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.sleepDuration,
      page: () => SleepDurationScreen(),
      binding: SleepDurationBinding(),
    ),
    GetPage(
      name: AppRoutes.wakeTime,
      page: () => WakeTimeViewScreen(),
      binding: WakeTimeBinding(),
    ),
    GetPage(
      name: AppRoutes.endDayTime,
      page: () => EndDayTimeViewScreen(),
      binding: EndDayTimeBinding(),
    ),
    GetPage(
      name: AppRoutes.procrastination,
      page: () => ProcrastinationScreen(),
      binding: ProcrastinationBinding(),
    ),
    GetPage(
      name: AppRoutes.focus,
      page: () => FocusScreen(),
      binding: FocusBinding(),
    ),
    GetPage(
      name: AppRoutes.influenced,
      page: () => InfluencedYouScreen(),
      binding: InfluencedBinding(),
    ),
    GetPage(
      name: AppRoutes.achieve,
      page: () => AchieveScreen(),
      binding: AchieveBinding(),
    ),
    GetPage(
      name: AppRoutes.contract,
      page: () => ContractScreen(),
      binding: ContractBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),

    GetPage(
      name: AppRoutes.createNewHabit,
      page: () => CreateNewHabitScreen(),
      binding: CreateNewHabitBinding(),
    ),

    GetPage(
      name: AppRoutes.moodStatHistory,
      page: () => MoodStatHistoryScreen(),
      binding: MoodStatHistoryBinding(),
    ),
  ];
}
