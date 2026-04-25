/// Centralized application string constants
/// All values are TRANSLATION KEYS — not raw text.
/// Use   AppStrings.anyKey.tr   in your widgets to get the translated string.
class AppStrings {
  AppStrings._();

  /* -------------------------------------------------------------------------- */
  /*                               General / Common                              */
  /* -------------------------------------------------------------------------- */

  static const String habitly        = 'habitly';
  static const String skip           = 'skip';
  static const String continueText   = 'continue';
  static const String signUp         = 'sign_up';
  static const String signIn         = 'sign_in';
  static const String email          = 'email';
  static const String password       = 'password';
  static const String or             = 'or';
  static const String rememberMe     = 'remember_me';
  static const String forgotPassword = 'forgot_password';
  static const String termsOfService = 'terms_of_service';
  static const String privacyPolicy  = 'privacy_policy';

  /* -------------------------------------------------------------------------- */
  /*                                 Onboarding                                  */
  /* -------------------------------------------------------------------------- */

  static const String onboardingTitle1    = 'onboarding_title_1';
  static const String onboardingSubtitle1 = 'onboarding_subtitle_1';

  static const String onboardingTitle2    = 'onboarding_title_2';
  static const String onboardingSubtitle2 = 'onboarding_subtitle_2';

  static const String onboardingTitle3    = 'onboarding_title_3';
  static const String onboardingSubtitle3 = 'onboarding_subtitle_3';

  static const String letsGetStarted = 'lets_get_started';
  static const String letsDiveInInto = 'lets_dive_in';

  /* -------------------------------------------------------------------------- */
  /*                              Authentication                                 */
  /* -------------------------------------------------------------------------- */

  static const String joinhabitlyTitle    = 'join_habitly_title';
  static const String joinhabitlySubtitle = 'join_habitly_subtitle';

  static const String welcomeBackTitle    = 'welcome_back_title';
  static const String welcomeBackSubtitle = 'welcome_back_subtitle';

  static const String agreeToTerms       = 'agree_to_terms';
  static const String termsAndConditions = 'terms_and_conditions';
  static const String alreadyHaveAccount = 'already_have_account';
  static const String dontHaveAccount    = 'dont_have_account';

  /* -------------------------------------------------------------------------- */
  /*                            Social Authentication                             */
  /* -------------------------------------------------------------------------- */

  static const String continueWithGoogle   = 'continue_with_google';
  static const String continueWithApple    = 'continue_with_apple';
  static const String continueWithFacebook = 'continue_with_facebook';
  static const String continueWithTwitter  = 'continue_with_twitter';

  /* -------------------------------------------------------------------------- */
  /*                             Forgot Password Flow                             */
  /* -------------------------------------------------------------------------- */

  static const String forgotPasswordTitle    = 'forgot_password_title';
  static const String forgotPasswordSubtitle = 'forgot_password_subtitle';
  static const String yourRegisteredEmail    = 'your_registered_email';

  static const String sendOtpCode = 'send_otp_code';

  static const String enterOtpTitle    = 'enter_otp_title';
  static const String enterOtpSubtitle = 'enter_otp_subtitle';
  static const String resendCode       = 'resend_code';
  static const String resendIn         = 'resend_in';

  static const String secureAccountTitle    = 'secure_account_title';
  static const String secureAccountSubtitle = 'secure_account_subtitle';

  static const String newPassword        = 'new_password';
  static const String confirmNewPassword = 'confirm_new_password';
  static const String saveNewPassword    = 'save_new_password';

  static const String passwordUpdatedTitle    = 'password_updated_title';
  static const String passwordUpdatedSubtitle = 'password_updated_subtitle';
  static const String goToHomepage            = 'go_to_homepage';

  /* -------------------------------------------------------------------------- */
  /*                              Onboarding Survey                               */
  /* -------------------------------------------------------------------------- */

  static const String howLongDoYouUsually     = 'how_long_sleep';
  static const String sleep                   = 'sleep';
  static const String atNight                 = 'at_night';
  static const String sleepSubtitle           = 'sleep_subtitle';

  static const String whatTimeDoYouUsually    = 'what_time_wake';
  static const String wakeUp                  = 'wake_up';
  static const String wakeUpQuestionMark      = 'wake_up_question';
  static const String wakeUpSubtitle          = 'wake_up_subtitle';

  static const String endYourDay              = 'end_your_day';
  static const String endYourDayQuestionMark  = 'end_your_day_question';
  static const String endDaySubtitle          = 'end_day_subtitle';

  static const String doYouOften                  = 'do_you_often';
  static const String procrastination             = 'procrastination';
  static const String procrastinationQuestionMark = 'procrastination_question';
  static const String procrastinationSubtitle     = 'procrastination_subtitle';

  static const String doYouOftenFindItHardTo = 'do_you_find_hard';
  static const String focus                  = 'focus';
  static const String focusQuestionMark      = 'focus_question';
  static const String focusSubtitle          = 'focus_subtitle';

  static const String whatInfluencedYouToBecome     = 'what_influenced_you';
  static const String organized                     = 'organized';
  static const String whatInfluencedYouQuestionMark = 'organized_question';
  static const String organizationSubtitle          = 'organization_subtitle';

  static const String whatTimeDoYouWantTo = 'what_do_you_want';
  static const String achieve             = 'achieve';
  static const String withhabitly        = 'with_habitly';
  static const String goalsSubtitle       = 'goals_subtitle';

  /* -------------------------------------------------------------------------- */
  /*                            Survey Options                                    */
  /* -------------------------------------------------------------------------- */

  static const String lessThan6Hours    = 'less_than_6_hours';
  static const String sixToSevenHours   = 'six_to_seven_hours';
  static const String sevenToEightHours = 'seven_to_eight_hours';
  static const String eightToNineHours  = 'eight_to_nine_hours';
  static const String moreThan9Hours    = 'more_than_9_hours';

  static const String always       = 'always';
  static const String sometimes    = 'sometimes';
  static const String constantly   = 'constantly';
  static const String occasionally = 'occasionally';
  static const String rarely       = 'rarely';
  static const String never        = 'never';
  static const String am           = 'am';
  static const String pm           = 'pm';

  static const String lackOfMotivation     = 'lack_of_motivation';
  static const String workOverload         = 'work_overload';
  static const String clutteredEnvironment = 'cluttered_environment';
  static const String digitalDistractions  = 'digital_distractions';
  static const String lackOfTimeManagement = 'lack_of_time_management';

  static const String buildHealthyHabits   = 'build_healthy_habits';
  static const String boostProductivity    = 'boost_productivity';
  static const String achievePersonalGoals = 'achieve_personal_goals';
  static const String manageStressAnxiety  = 'manage_stress';
  static const String otherSpecify         = 'other_specify';

  /* -------------------------------------------------------------------------- */
  /*                                 Contract                                     */
  /* -------------------------------------------------------------------------- */

  static const String contractTitle           = 'contract_title';
  static const String contract                = 'contract';
  static const String contractEmoji           = 'contract_emoji';
  static const String reviewAndSignCommitment = 'review_and_sign';

  static const String contractLine1 = 'contract_line_1';
  static const String contractLine2 = 'contract_line_2';
  static const String contractLine3 = 'contract_line_3';
  static const String contractLine4 = 'contract_line_4';

  static const String signUsingFinger = 'sign_using_finger';
  static const String finish          = 'finish';

  /* -------------------------------------------------------------------------- */
  /*                             Bottom Navigation                                */
  /* -------------------------------------------------------------------------- */

  static const String home     = 'home';
  static const String moodStat = 'mood_stat';
  static const String report   = 'report';
  static const String myHabits = 'my_habits';
  static const String account  = 'account';

  /* -------------------------------------------------------------------------- */
  /*                               Home Screen                                   */
  /* -------------------------------------------------------------------------- */

  static const String morning   = 'morning';
  static const String afternoon = 'afternoon';
  static const String evening   = 'evening';

  static const String createNewHabit = 'create_new_habit';
  static const String regularHabit   = 'regular_habit';
  static const String oneTimeTask    = 'one_time_task';

  static const String habitName  = 'habit_name';
  static const String taskName   = 'task_name';
  static const String icon       = 'icon';
  static const String emoji      = 'emoji';
  static const String viewAll    = 'view_all';
  static const String chooseIcon = 'choose_icon';
  static const String searchIcon = 'search_icon';

  /* -------------------------------------------------------------------------- */
  /*                           Create New Habit Screen                            */
  /* -------------------------------------------------------------------------- */

  static const String color        = 'color';
  static const String pickAColor   = 'pick_a_color';
  static const String select       = 'select';
  static const String when         = 'when';
  static const String repeat       = 'repeat';
  static const String daily        = 'daily';
  static const String monthly      = 'monthly';
  static const String onTheseDay   = 'on_these_day';
  static const String allDay       = 'all_day';
  static const String doItAt       = 'do_it_at';
  static const String endHabitOn   = 'end_habit_on';
  static const String setReminder  = 'set_reminder';
  static const String date         = 'date';
  static const String everyMonthOn = 'every_month_on';
  static const String daysPerWeek  = 'days_per_week';

  /* -------------------------------------------------------------------------- */
  /*                               Report Screen                                  */
  /* -------------------------------------------------------------------------- */

  static const String habitsCompleted  = 'habits_completed';
  static const String totalPerfectDays = 'total_perfect_days';
  static const String currentStreak    = 'current_streak';
  static const String completionRate   = 'completion_rate';
  static const String days             = 'days';

  static const String habitsCompletedTitle = 'habits_completed_title';
  static const String habitCompletionRate  = 'habit_completion_rate';
  static const String calendarStats        = 'calendar_stats';
  static const String moodChart            = 'mood_chart';

  static const String all         = 'all';
  static const String today       = 'today';
  static const String weekly      = 'weekly';
  static const String overall     = 'overall';
  static const String thisWeek    = 'this_week';
  static const String thisMonth   = 'this_month';
  static const String lastMonth   = 'last_month';
  static const String last6Months = 'last_6_months';
  static const String thisYear    = 'this_year';
  static const String lastYear    = 'last_year';
  static const String allTime     = 'all_time';
  static const String customRange = 'custom_range';

  static const String december2024 = 'december_2024';
  static const String mon = 'mon';
  static const String tue = 'tue';
  static const String wed = 'wed';
  static const String thu = 'thu';
  static const String fri = 'fri';
  static const String sat = 'sat';
  static const String sun = 'sun';

  /* -------------------------------------------------------------------------- */
  /*                          Mood Bottom Sheet – Step 1                          */
  /* -------------------------------------------------------------------------- */

  static const String howIsYourMoodToday = 'how_is_mood_today';

  static const String great   = 'great';
  static const String good    = 'good';
  static const String okay    = 'okay';
  static const String notGood = 'not_good';
  static const String bad     = 'bad';

  static const String iFeelGreat = 'i_feel_great';

  static const String cancel = 'cancel';
  static const String ok     = 'ok';

  /* -------------------------------------------------------------------------- */
  /*                          Mood Bottom Sheet – Step 2                          */
  /* -------------------------------------------------------------------------- */

  static const String howWouldYouDescribeYourFeelings = 'how_describe_feelings';

  static const String happy     = 'happy';
  static const String brave     = 'brave';
  static const String motivated = 'motivated';
  static const String creative  = 'creative';
  static const String confident = 'confident';
  static const String calm      = 'calm';
  static const String grateful  = 'grateful';
  static const String peaceful  = 'peaceful';
  static const String excited   = 'excited';
  static const String loved     = 'loved';
  static const String hopeful   = 'hopeful';
  static const String inspired  = 'inspired';
  static const String proud     = 'proud';
  static const String euphoric  = 'euphoric';
  static const String nostalgic = 'nostalgic';

  static const String iFeelConfident = 'i_feel_confident';
  static const String save           = 'save';
}