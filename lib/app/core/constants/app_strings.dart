/// Centralized application string constants
/// Prevents duplication and supports scalability & localization
class AppStrings {
  // Private constructor to prevent instantiation
  AppStrings._();

  /* -------------------------------------------------------------------------- */
  /*                               General / Common                              */
  /* -------------------------------------------------------------------------- */

  static const String habitly = "habitly";
  static const String skip = 'Skip';
  static const String continueText = 'Continue';
  static const String signUp = 'Sign up';
  static const String signIn = 'Sign in';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String or = 'or';
  static const String rememberMe = 'Remember me';
  static const String forgotPassword = 'Forgot Password?';
  static const String termsOfService = 'Terms of Service';
  static const String privacyPolicy = 'Privacy Policy';

  /* -------------------------------------------------------------------------- */
  /*                                 Onboarding                                  */
  /* -------------------------------------------------------------------------- */

  static const String onboardingTitle1 =
      'Welcome to habitly - Your Personal Habit Tracker!';
  static const String onboardingSubtitle1 =
      'Take control of your habits and transform your life with habitly. Let\'s get started on your journey to success!';

  static const String onboardingTitle2 =
      'Explore habitly Features for Your Journey!';
  static const String onboardingSubtitle2 =
      'With intuitive habit creation and insightful progress tracking, habitly makes it easy to stay focused, motivated, and accountable.';

  static const String onboardingTitle3 =
      'Unlock Your Potential with habitly Now!';
  static const String onboardingSubtitle3 =
      'Achieve your goals with habitly\'s suite of features. Start your habit journey today and unlock your full potential!';

  static const String letsGetStarted = 'Let\'s Get Started';
  static const String letsDiveInInto = 'Let\'s dive in into your account';

  /* -------------------------------------------------------------------------- */
  /*                              Authentication                                 */
  /* -------------------------------------------------------------------------- */

  static const String joinhabitlyTitle = 'Join habitly Today ✨';
  static const String joinhabitlySubtitle =
      'Start your habit journey with habitly. It\'s quick, easy, and free!';

  static const String welcomeBackTitle = 'Welcome Back! 👋';
  static const String welcomeBackSubtitle =
      'Sign in to access your personalized habit tracking experience.';

  static const String agreeToTerms = 'I agree to habitly';
  static const String termsAndConditions = ' Terms & Conditions.';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String dontHaveAccount = 'Don\'t have an account?';

  /* -------------------------------------------------------------------------- */
  /*                            Social Authentication                             */
  /* -------------------------------------------------------------------------- */

  static const String continueWithGoogle = 'Continue with Google';
  static const String continueWithApple = 'Continue with Apple';
  static const String continueWithFacebook = 'Continue with Facebook';
  static const String continueWithTwitter = 'Continue with Twitter';

  /* -------------------------------------------------------------------------- */
  /*                             Forgot Password Flow                             */
  /* -------------------------------------------------------------------------- */

  static const String forgotPasswordTitle = 'Forgot Your Password? 🔑';
  static const String forgotPasswordSubtitle =
      'Enter the email associated with your habitly account to receive a password reset code.';
  static const String yourRegisteredEmail = "Your Registered Email";

  static const String sendOtpCode = 'Send OTP Code';

  static const String enterOtpTitle = 'Enter OTP Code 🔐';
  static const String enterOtpSubtitle =
      'Check your email inbox for a password reset code. Enter the code below to continue.';
  static const String resendCode = 'Resend code';
  static const String resendIn = 'You can resend the code in';

  static const String secureAccountTitle = 'Secure Your Account 🔒';
  static const String secureAccountSubtitle =
      'Create a new password for your habitly account. Make sure it\'s secure and easy to remember.';

  static const String newPassword = 'New Password';
  static const String confirmNewPassword = 'Confirm New Password';
  static const String saveNewPassword = 'Save New Password';

  static const String passwordUpdatedTitle = 'You\'re All Set!';
  static const String passwordUpdatedSubtitle =
      'Your password has been successfully updated.';
  static const String goToHomepage = 'Go to Homepage';

  /* -------------------------------------------------------------------------- */
  /*                              Onboarding Survey                               */
  /* -------------------------------------------------------------------------- */

  static const String howLongDoYouUsually = 'How long do you usually ';
  static const String sleep = 'sleep';
  static const String atNight = ' at night? 😴';

  static const String sleepSubtitle =
      'Understanding your sleep patterns helps us tailor your habit tracking experience.';

  static const String whatTimeDoYouUsually = 'What time do you usually ';
  static const String wakeUp = 'wake up';
  static const String wakeUpQuestionMark = '? 🌞';

  static const String wakeUpSubtitle =
      'Setting your wake-up time helps us create your personalized habit schedule.';

  static const String endYourDay = 'end your day';
  static const String endYourDayQuestionMark = '? 🌙';
  static const String endDaySubtitle =
      'Let us know when you typically end your day to optimize your habit tracking.';

  static const String doYouOften = 'Do you often ';

  static const String procrastination = 'procrastinate';
  static const String procrastinationQuestionMark = '? 👀';

  static const String procrastinationSubtitle =
      'Understanding your procrastination tendencies helps us tailor strategies to overcome them.';

  static const String doYouOftenFindItHardTo = 'Do you often find it hard to ';
  static const String focus = 'focus';
  static const String focusQuestionMark = '? 🎯';

  static const String focusSubtitle =
      'Let us know if focus is a struggle for you so we can provide targeted support.';

  static const String whatInfluencedYouToBecome =
      'What influenced you to become ';
  static const String organized = 'organized';
  static const String whatInfluencedYouQuestionMark = '? 🧘';

  static const String organizationSubtitle =
      'Understanding your motivations helps us align habitly with your goals. Select all that apply.';

  static const String whatTimeDoYouWantTo = 'What do you want to ';

  static const String achieve = 'achieve';
  static const String withhabitly = ' with habitly? 🎯';
  static const String goalsSubtitle =
      'Your aspirations guide our efforts to support and empower you on your journey. Select all that apply.';

  /* -------------------------------------------------------------------------- */
  /*                            Survey Options                                    */
  /* -------------------------------------------------------------------------- */

  static const String lessThan6Hours = 'Less than 6 hours';
  static const String sixToSevenHours = '6 - 7 hours';
  static const String sevenToEightHours = '7 - 8 hours';
  static const String eightToNineHours = '8 - 9 hours';
  static const String moreThan9Hours = 'More than 9 hours';

  static const String always = 'Always';
  static const String sometimes = 'Sometimes';
  static const String constantly = 'Constantly';
  static const String occasionally = 'Occasionally';
  static const String rarely = 'Rarely';
  static const String never = 'Never';
  static const String am = 'AM';
  static const String pm = 'PM';

  static const String lackOfMotivation = 'Lack of Motivation';
  static const String workOverload = 'Work Overload';
  static const String clutteredEnvironment = 'Cluttered Environment';
  static const String digitalDistractions = 'Digital Distractions';
  static const String lackOfTimeManagement = 'Lack of Time Management';

  static const String buildHealthyHabits = 'Build Healthy Habits';
  static const String boostProductivity = 'Boost Productivity';
  static const String achievePersonalGoals = 'Achieve Personal Goals';
  static const String manageStressAnxiety = 'Manage Stress & Anxiety';
  static const String otherSpecify = 'Other (Specify)';

  /* -------------------------------------------------------------------------- */
  /*                                 Contract                                     */
  /* -------------------------------------------------------------------------- */

  static const String contractTitle = 'Let\'s make a ';
  static const String contract = 'contract';
  static const String contractEmoji = ' ✍️';
  static const String reviewAndSignCommitment =
      'Review & sign your personalized commitment '
      'to achieving your goals with habitly.';

  static const String contractLine1 = 'I commit to tracking my habits daily 📅';
  static const String contractLine2 =
      'I promise to prioritize my well-being 💜';
  static const String contractLine3 =
      'I will strive for consistency and progress ✨';
  static const String contractLine4 =
      'I understand that change takes time and effort 💪';

  static const String signUsingFinger = 'Sign using your finger:';
  static const String finish = 'Finish';

  // =======================
  // Bottom Navigation
  // =======================

  static const home = 'Home';
  static const moodStat = 'Mood Stat';
  static const report = 'Report';
  static const myHabits = 'My Habits';
  static const account = 'Account';

  // =======================
  // Home Screen
  // =======================

  static const morning = 'Morning';
  static const afternoon = 'Afternoon';
  static const evening = 'Evening';

  static const createNewHabit = 'Create New Habit';

  static const regularHabit = 'Regular Habit';
  static const oneTimeTask = 'One-Time Task';

  static const habitName = 'Habit Name';
  static const taskName = 'Task Name';
  static const icon = 'Icon';
  static const emoji = 'Emoji';
  static const viewAll = 'View All';
  static const chooseIcon = 'Choose Icon';
  static const searchIcon = 'Search Icon';

  // =======================
  // Create New habit Screen
  // =======================

  static const color = 'Color';
  static const pickAColor = 'Pick a Color';
  static const select = 'Select';
  static const when = 'When';
  static const repeat = 'Repeat';
  static const daily = 'Daily';
  static const monthly = 'Monthly';
  static const onTheseDay = 'On These Day';
  static const allDay = 'All Day';
  static const doItAt = 'Do it at:';
  static const endHabitOn = 'End Habit on';
  static const setReminder = 'Set Reminder';
  static const date = 'Date';
  static const everyMonthOn = 'Every month on';
  static const daysPerWeek = 'days per week';
  // =======================
  // Report Screen
  // =======================

  // Stats cards
  static const habitsCompleted = 'Habits completed';
  static const totalPerfectDays = 'Total perfect days';
  static const currentStreak = 'Current streak';
  static const completionRate = 'Completion rate';
  static const days = 'days';

  // Sections
  static const habitsCompletedTitle = 'Habits Completed';
  static const habitCompletionRate = 'Habit Completion Rate';
  static const calendarStats = 'Calendar Stats';
  static const moodChart = 'Mood Chart';

  // Time ranges
  static const all = 'All';
  static const today = 'Today';
  static const weekly = 'Weekly';
  static const overall = 'Overall';
  static const thisWeek = 'This Week';
  static const thisMonth = 'This Month';
  static const lastMonth = 'Last Month';
  static const last6Months = 'Last 6 Months';
  static const thisYear = 'This Year';
  static const lastYear = 'Last Year';
  static const allTime = 'All Time';
  static const customRange = 'Custom Range';

  // Calendar
  static const december2024 = 'December 2024';
  static const mon = 'Mon';
  static const tue = 'Tue';
  static const wed = 'Wed';
  static const thu = 'Thu';
  static const fri = 'Fri';
  static const sat = 'Sat';
  static const sun = 'Sun';

  // =======================
  // Mood Bottom Sheet – Step 1
  // =======================

  static const howIsYourMoodToday = 'How is your mood today?';

  static const great = 'Great';
  static const good = 'Good';
  static const okay = 'Okay';
  static const notGood = 'Not Good';
  static const bad = 'Bad';

  static const iFeelGreat = 'I Feel Great!';

  static const cancel = 'Cancel';
  static const ok = 'OK';

  // =======================
  // Mood Bottom Sheet – Step 2
  // =======================

  static const howWouldYouDescribeYourFeelings =
      'Great! How would you describe your feelings?';

  static const happy = 'Happy';
  static const brave = 'Brave';
  static const motivated = 'Motivated';
  static const creative = 'Creative';
  static const confident = 'Confident';
  static const calm = 'Calm';
  static const grateful = 'Grateful';
  static const peaceful = 'Peaceful';
  static const excited = 'Excited';
  static const loved = 'Loved';
  static const hopeful = 'Hopeful';
  static const inspired = 'Inspired';
  static const proud = 'Proud';
  static const euphoric = 'Euphoric';
  static const nostalgic = 'Nostalgic';

  static const iFeelConfident = 'I Feel Confident!';
  static const save = 'save';
}
