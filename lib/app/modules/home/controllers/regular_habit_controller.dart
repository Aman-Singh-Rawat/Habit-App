import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_lists.dart';
import '../../../core/constants/emoji_icon_data.dart';
import '../../../core/utils/helpers/DateClass.dart';

class RegularHabitController extends GetxController
    with GetTickerProviderStateMixin {
  /// class instance
  static RegularHabitController get instance =>
      Get.find<RegularHabitController>();

  /// ================================================ X VARIABLES X ================================================

  /// controllers
  final habitController = TextEditingController();

  /// [Create NEW HABIT TAB CONTROLLER]
  late final createNewHabitParentTabController;

  /// [CHOOSE ICON TAB CONTROLLER]
  late final chooseIconTabController;

  /// ================================================ X OBSERVABLES X ================================================

  /// create new habit tab controller
  final RxInt createNewHabitParentTabIndex = (0).obs;

  /// icon view all tab controller
  final RxInt selectedIconTabIndex = (0).obs;

  /// icon selected index
  final RxInt iconSelectedIndex = (-1).obs;
  final RxInt emojiSelectedIndex = (-1).obs;

  /// color section [SELECTED_COLOR] ==> initially we assuming the first color is selected
  final Rx<Color> selectedColor = AppLists.habitlyColors[0].obs;
  final Rx<int> selectedColorIndex = (0).obs;
  final RxBool isColorPickerSelected = false.obs;
  final Rx<Color> lastSelectedColor = AppLists.habitlyColors[0].obs;

  /// =================================== X REPEAT TYPE SECTION X ===================================

  /// Repeat Type[daily, weekly, monthly];
  final RxInt selectedRepeatTypeIndex = 0.obs;

  /// on these day [daily]
  final RxBool isOnTheseDayCheckboxSelected = true.obs;

  /// on these day [weekly]
  final RxInt repeatSelectedPerWeekValue = (-1).obs;

  /// monthly section
  final RxList<int> selectedMonthlyDays = <int>[].obs;

  /// =================================== X REPEAT TYPE SECTION [CLOSE] X ===================================
  final RxList<int> repeatSelectedDaysList = <int>[1, 2, 3, 4, 5, 6, 7].obs;

  /// DO IT AT
  Rx<int> selectedDoItAtIndex = 0.obs;

  /// =================================== X End Habit On X ===================================

  /// for switch
  final RxBool isEndHabitOn = false.obs;

  /// date or days
  final RxInt selectedEndHabitIndex = 0.obs;

  /// text field where date is selecting
  final endHabitDatePickerController = TextEditingController();

  final Rx<DateTime> endHabitFocusedDay = DateTime.now().obs;
  Rx<DateTime?> endHabitSelectedDate = Rx<DateTime?>(null);

  /// Reminder section Works start here
  RxBool isSetRegularReminder = false.obs;
  RxBool isSetOneTimeRegularReminder = false.obs;

  final TextEditingController setReminderHabitTimeController =
      TextEditingController();
  final setReminderTaskTimeController = TextEditingController(
    text: strPleaseSelectReminderTime,
  );

  /// for selected time picker value
  int? reminderHour;
  int? reminderMinute;

  /// ================================================ X GET-X METHODS X ================================================

  @override
  void onInit() {
    super.onInit();

    createNewHabitParentTabController = TabController(length: 2, vsync: this);
    chooseIconTabController = TabController(length: 2, vsync: this);

    /// CREATE NEW HABIT controller
    createNewHabitParentTabController.addListener(() {
      if (!createNewHabitParentTabController.indexIsChanging) {
        createNewHabitParentTabIndex.value =
            createNewHabitParentTabController.index;
      }
    });

    /// BOTTOM  SHEET  controller
    chooseIconTabController.addListener(() {
      if (!chooseIconTabController.indexIsChanging) {
        selectedIconTabIndex.value = chooseIconTabController.index;
      }
    });

    endHabitDatePickerController.text = getEndHabitPlaceholder;

    /// first time the how many days will be 7 in repeat widget
    repeatSelectedPerWeekValue.value = 7;

    /// if [isOnTheseDayCheckboxSelected] is selected means user selected all day so weekly will be choose all day
    ever(isOnTheseDayCheckboxSelected, (callback) {
      if (callback) {
        repeatSelectedPerWeekValue.value = 7;

        /// this is for daily days if 7 days a week chosen then remove all elements from monthly
        selectedMonthlyDays.clear();
      }
    });
  }

  /// X ================================================ X FUNCTIONS X ================================================ X

  /// ================== X CHOOSE ICON [bottomSheet] X ==================
  void onIconSelected(int index) {
    if (iconSelectedIndex.value == index) {
      iconSelectedIndex.value = -1;
    } else {
      emojiSelectedIndex.value = -1;
      iconSelectedIndex.value = index;
    }
  }

  void onEmojiSelected(int index) {
    if (emojiSelectedIndex.value == index) {
      emojiSelectedIndex.value = -1;
    } else {
      iconSelectedIndex.value = -1;
      emojiSelectedIndex.value = index;
    }
  }

  void onChooseIconCancelClick() {
    iconSelectedIndex.value = -1;
    emojiSelectedIndex.value = -1;
    Get.back(result: false);
  }

  void onChooseIconOkClick(BuildContext context) {
    if (iconSelectedIndex.value == -1 && emojiSelectedIndex.value == -1) {
      AppToast.show(
        context,
        message: strPleaseSelectAnIconOrEmoji,
        type: .info,
      );
      return;
    }
    Get.back(result: true);
  }

  void onChooseIconBottomSheetClose(value) {
    if (value == null || value == false) {
      iconSelectedIndex.value = emojiSelectedIndex.value = -1;
      selectedIconTabIndex.value = chooseIconTabController.index = 0;
    }
  }

  String? get selectedEmojiOrIcon {
    if (iconSelectedIndex.value != -1) {
      return EmojiList.icons[iconSelectedIndex.value].emoji;
    }

    if (emojiSelectedIndex.value != -1) {
      return EmojiList.smileysAndEmotion[emojiSelectedIndex.value].emoji;
    }

    return null;
  }

  /// ================== X [CLOSE] X ==================

  /// ================== X [COLOR_SECTION] X ==================
  void onColorSelected(int index) {
    if (AppLists.habitlyColors[index] != lastSelectedColor.value) {
      lastSelectedColor.value = AppLists.habitlyColors[index];
    }

    if (index < AppLists.habitlyColors.length) {
      selectedColor.value = AppLists.habitlyColors[index];
      selectedColorIndex.value = index;
      isColorPickerSelected.value = false;
    }
  }

  void onColorChanged(Color color) {
    selectedColor.value = color;
  }

  void onColorPickerDialogClose(value) {
    if (value == null || value == false) {
      isColorPickerSelected.value = false;
      selectedColor.value = AppLists.habitlyColors[0];
    } else {
      isColorPickerSelected.value = true;
      selectedColorIndex.value = 14;
    }

    Get.log(
      "debugging:: onColorPickerDialogClose:: $value & the color is:: ${selectedColor.value}",
    );
  }

  /// Repeat Type [daily, weekly, monthly]
  void handleRepeatTypeWidgetClick(int index) {
    selectedRepeatTypeIndex.value = index;
  }

  /// on these day [ALL_DAY]
  void handleOnAllDayCheckboxClick(bool? value) {
    isOnTheseDayCheckboxSelected.value = value ?? false;

    if (isOnTheseDayCheckboxSelected.value) {
      repeatSelectedDaysList.value = List.generate(7, (index) => index + 1);
    } else {
      repeatSelectedDaysList.value = [];
    }
  }

  /// Stores selected week days using 1-based indexing:
  /// 1 = Monday, 2 = Tuesday, 3 = Wednesday,
  /// 4 = Thursday, 5 = Friday, 6 = Saturday, 7 = Sunday
  void onRepeatSelectedDayChoose(int index) {
    final day = index + 1;

    if (repeatSelectedDaysList.contains(day)) {
      repeatSelectedDaysList.remove(day);
    } else {
      repeatSelectedDaysList.add(day);
      repeatSelectedPerWeekValue.value = -1;
    }

    isOnTheseDayCheckboxSelected.value = repeatSelectedDaysList.length == 7;

    if (!isOnTheseDayCheckboxSelected.value) {
      repeatSelectedPerWeekValue.value = -1;
    }
  }

  /// Repeat Type [weekly]
  void onRepeatWeeklyDaysClick(int value) {
    if (repeatSelectedPerWeekValue.value == value) {
      repeatSelectedPerWeekValue.value = -1;

      return;
    }
    repeatSelectedDaysList.clear();
    selectedMonthlyDays.clear();
    repeatSelectedPerWeekValue.value = value;

    /// this is for daily days if 7 days a week chosen
    if (repeatSelectedPerWeekValue.value == 7) {
      selectedRepeatTypeIndex.value = 0;
      isOnTheseDayCheckboxSelected.value = true;
      repeatSelectedDaysList.value = List.generate(7, (index) => index + 1);
    } else {
      isOnTheseDayCheckboxSelected.value = false;
    }
  }

  /// End Habit on
  void onEndHabitOn(bool value) {
    isEndHabitOn.value = value;
  }

  void onEndHabitOnFilterTabTap(int index) {
    selectedEndHabitIndex.value = index;

    if (endHabitSelectedDate.value == null) {
      endHabitDatePickerController.text = getEndHabitPlaceholder;
    } else {
      handleEndHabitSelectedDate();
    }
  }

  bool onSelectedDayPredicate(DateTime day) {
    final normalizeValue = normalizeDate(day);
    return endHabitSelectedDate.value == normalizeValue;
  }

  void onSingleDaySelected(DateTime selected, DateTime focusedDate) {
    endHabitSelectedDate.value = normalizeDate(selected);
    endHabitFocusedDay.value = focusedDate;

    // Update text immediately
    //onEndHabitDateDays(selectedEndHabitIndex.value);
  }

  String get getEndHabitPlaceholder {
    return selectedEndHabitIndex.value == 0
        ? strSelectAnEndDate
        : strSelectDurationInDays;
  }

  void handleEndHabitOnOkClick(BuildContext context) {
    if (endHabitSelectedDate.value == null) {
      AppToast.show(context, message: strPleaseSelectADate, type: .warning);
      return;
    }

    handleEndHabitSelectedDate();

    Get.back();
  }

  void handleEndHabitSelectedDate() {
    final selected = normalizeDate(endHabitSelectedDate.value!);
    if (selectedEndHabitIndex.value == 0) {
      // Date mode
      endHabitDatePickerController.text = DateClass.formatMonthDayYear(
        selected,
      );
    } else {
      // Days mode
      final today = normalizeDate(DateTime.now());
      final days = selected.difference(today).inDays;

      endHabitDatePickerController.text = days == 0
          ? strThisHabitEndsToday
          : endHabitDatePickerController.text = strEndsIn + ' $days ' + strDays;
    }
  }

  /// /// ================== X [REMAINDER_FUNCTIONS] X ==================
  void onSetReminder(bool flag) {
    isSetRegularReminder.value = flag;
    if (isSetRegularReminder.value) {
      setReminderHabitTimeController.text = strPleaseSelectReminderTime;
    }
  }

  void onOneTimeSetReminder(bool flag) {
    isSetOneTimeRegularReminder.value = flag;
    if (isSetOneTimeRegularReminder.value) {
      setReminderHabitTimeController.text = strPleaseSelectReminderTime;
    }
  }

  /// ================== X [CLOSE] X ==================

  /// ================== X [CREATE_NEW_HABIT_FUNCTION] X ==================
  void onRepeatDateSelected(int index) {
    if (selectedMonthlyDays.contains(index)) {
      selectedMonthlyDays.remove(index);
    } else {
      /// if any days select in monthly then ==>
      selectedMonthlyDays.add(index);

      /// -- if checkbox is selected in daily then off that
      isOnTheseDayCheckboxSelected.value = false;

      /// -- remove all days from daily
      repeatSelectedDaysList.clear();

      /// -- remove days selection from weekly
      repeatSelectedPerWeekValue.value = -1;
    }
  }

  /// ================== X [For_Remainder] X ==================
  void showTimePickerDialog(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && context.mounted) {
      controller.text = picked.format(context);
      reminderHour = picked.hour;
      reminderMinute = picked.minute;
    } else {
      controller.text = strPleaseSelectReminderTime;
    }
  }

  /// -------------------- Validation --------------------

  bool _validateRegularHabit(BuildContext context) {

    /// -- Habit name validation
    if (habitController.text.trim().isEmpty) {
      AppToast.warning(context, strPleaseEnterHabitName);
      return false;
    }

    /// -- Repeat validation
    final bool isNoRepeatSelected =
        repeatSelectedDaysList.isEmpty &&
            repeatSelectedPerWeekValue.value == -1 &&
            selectedMonthlyDays.isEmpty;

    if (isNoRepeatSelected) {
      AppToast.warning(context, strPleaseSelectHabitDay);
      return false;
    }

    /// -- End date validation
    final bool isEndDateMissing =
        isEndHabitOn.value &&
            endHabitSelectedDate.value == null;

    if (isEndDateMissing) {
      AppToast.warning(context, strPleaseSelectEndDate);
      return false;
    }

    /// -- Reminder validation
    final bool isReminderTimeMissing =
        isSetRegularReminder.value &&
            (reminderHour == null || reminderMinute == null);

    if (isReminderTimeMissing ||
        setReminderHabitTimeController.text ==
            strPleaseSelectReminderTime) {
      AppToast.warning(context, strReminderIsWaitingForATime);
      return false;
    }

    return true;
  }
  /// -------------------- Save Habit --------------------

  void onRegularHabitSave(BuildContext context) {
    /// -- Validating first
    if (!_validateRegularHabit(context)) return;

    /// --------------------
    /// save API / logic here
    /// --------------------
  }

}
