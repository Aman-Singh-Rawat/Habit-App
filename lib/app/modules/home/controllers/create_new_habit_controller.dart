import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/emoji_icon_data.dart';
import 'package:habitly/app/core/utils/helpers/DateClass.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/data/local/local_storage.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  String title;
  String description;

  Event({required this.title, required this.description});
}

class CreateNewHabitController extends GetxController
    with GetTickerProviderStateMixin {
  /// class instance
  static CreateNewHabitController get instance =>
      Get.find<CreateNewHabitController>();

  // tab controller
  late TabController controller, chooseIconTabController;

  /// other variables
  final habitController = TextEditingController();
  RxInt selectedTabIndex = 0.obs;
  RxInt selectedIconTabIndex = 0.obs;
  RxInt emojiSelectedIndex = (-1).obs;
  RxInt iconSelectedIndex = (-1).obs;
  RxBool endHabitOn = false.obs;
  RxBool setRegularReminder = false.obs;
  RxBool setOneTimeRegularReminder = false.obs;

  /// Regular Habit
  RxInt regularHabitIconSelectedIndex = (-1).obs;

  /// for color picker
  Rx<Color> selectedColor = AppLists.habitlyColors[0].obs;
  Rx<int> selectedColorIndex = (0).obs;

  /// for repeat section
  Rx<int> selectedRepeatIndex = 0.obs;

  // on these day
  Rx<bool> allDay = true.obs;
  RxList<int> selectedDayIndexList = [1, 2, 3, 4, 5, 6, 7].obs;

  // doItAt
  Rx<int> selectedDoItAtIndex = 0.obs;

  // calendar picker
  final RxList<Event> selectedEvents = <Event>[].obs;
  final Map<DateTime, List<Event>> events = {};

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  Rx<DateTime?> rangeStart = Rx<DateTime?>(null);
  Rx<DateTime?> rangeEnd = Rx<DateTime?>(null);
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOff.obs;

  final RxSet<DateTime> multiSelectedDays = <DateTime>{}.obs;

  DateTime normalize(DateTime day) => DateTime(day.year, day.month, day.day);

  // per weak
  RxInt selectedPerWeak = (-1).obs;

  // End Habit On
  RxInt selectedEndHabitIndex = 0.obs;
  final TextEditingController endHabitDatePickerController =
      TextEditingController();
  RxString endHabitSelectedDateText = ''.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<DateTime> endHabitFocusedDay = DateTime.now().obs;

  // Set Reminder
  final TextEditingController setReminderHabitTimeController =
      TextEditingController();

  /// [ONE TIME TASK]::
  // task controller
  final taskController = TextEditingController();
  final whenController = TextEditingController(text: strPleaseSelectADate);
  final setReminderTaskTimeController = TextEditingController(
    text: strPleaseSelectReminderTime,
  );

  final Rx<DateTime> whenFocusedDay = DateTime.now().obs;

  Rx<DateTime?> whenSelectedDate = Rx<DateTime?>(null);
  final List<String> _repeatTypes = [strDaily, strWeekly, strMonthly];
  final List<String> _doItAtTypes = [strMorning, strAfternoon, strEvening];
  int? reminderHour;
  int? reminderMinute;

  final regularFormKey = GlobalKey<FormState>();
  final oneTimeFormKey = GlobalKey<FormState>();

  /// Functions
  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    chooseIconTabController = TabController(length: 2, vsync: this);

    /// BOTTOM  SHEET  controller
    chooseIconTabController.addListener(() {
      if (!chooseIconTabController.indexIsChanging) {
        selectedIconTabIndex.value = chooseIconTabController.index;
      }
    });

    /// CREATE NEW HABIT controller
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        selectedTabIndex.value = controller.index;
      }
    });

    // for on these day
    ever(selectedDayIndexList, (_) {
      allDay.value = selectedDayIndexList.length == 7;
    });

    endHabitDatePickerController.text = getEndHabitPlaceholder();
    setReminderHabitTimeController.text = strPleaseSelectReminderTime;

    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    chooseIconTabController.dispose();
    super.onClose();
  }

  //  X=============================== X =============================== X

  List<DateTime> daysInRange(DateTime start, DateTime end) {
    final days = <DateTime>[];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      days.add(DateTime(start.year, start.month, start.day + i));
    }
    return days;
  }

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [for (final day in days) ...getEventsForDay(day)];
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime newFocusedDay) {
    selectedDay.value = null;
    focusedDay.value = newFocusedDay;

    rangeStart.value = start;
    rangeEnd.value = end;
    rangeSelectionMode.value = RangeSelectionMode.toggledOn;

    if (start != null && end != null) {
      selectedEvents.value = getEventsForRange(start, end);
    } else if (start != null) {
      selectedEvents.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents.value = getEventsForDay(end);
    }
  }

  //  X=============================== X =============================== X

  // Regular - One-time task related work
  bool isSelected(int index) {
    return selectedTabIndex.value == index;
  }

  bool isChooseIconTabSelected(int index) {
    return selectedIconTabIndex.value == index;
  }

  void onChooseIconTabClick(int index) {
    selectedIconTabIndex.value = index;
    chooseIconTabController.animateTo(index);
  }

  void onTabClick(int index) {
    selectedTabIndex.value = index;
    controller.animateTo(index);
    update();
  }

  void onEmojiSelected(int index) {
    emojiSelectedIndex.value = index;
  }

  bool isEmojiSelected(int index) {
    return emojiSelectedIndex.value == index;
  }

  void onIconSelected(int index) {
    iconSelectedIndex.value = index;
  }

  void onColorSelected(int index) {
    selectedColor.value = AppLists.habitlyColors[index];
    selectedColorIndex.value = index;
    debugPrint("debug:: onColorSelected:: $index");
  }

  void onColorChanged(Color color) {
    selectedColor.value = color;
    selectedColorIndex.value = 0;
  }

  void onSelectedDayChoose(int index) {
    if (selectedDayIndexList.contains(index)) {
      dev.log("debugOnSelectedDayChoose remove===> $index");
      selectedDayIndexList.remove(index);
    } else {
      dev.log("debugOnSelectedDayChoose add===> $index");
      selectedDayIndexList.add(index);
      selectedDayIndexList.sort();
    }

    _updateAllDay();
  }

  bool isSelectedDayContains(int index) {
    return selectedDayIndexList.contains(index);
  }

  void _updateAllDay() {
    allDay.value = selectedDayIndexList.length == 7;
  }

  void toggleAllDay(bool? flag) {
    final isChecked = flag ?? false;
    dev.log("debugs:: $isChecked");

    if (isChecked) {
      // ✅ select all
      selectedDayIndexList.assignAll([0, 1, 2, 3, 4, 5, 6]);
    } else {
      // ✅ deselect all
      selectedDayIndexList.clear();
    }
  }

  void onEndHabitOn(bool flag) {
    endHabitOn.value = flag;
    selectedEndHabitIndex.value = 0;
    endHabitDatePickerController.text = strSelectAnEndDate;
  }

  void onSetReminder(bool flag) {
    setRegularReminder.value = flag;
    if (setRegularReminder.value) {
      setReminderHabitTimeController.text = strPleaseSelectReminderTime;
    }
  }

  void onOneTimeSetReminder(bool flag) {
    setOneTimeRegularReminder.value = flag;
    if (setOneTimeRegularReminder.value) {
      setReminderHabitTimeController.text = strPleaseSelectReminderTime;
    }
  }

  void onEndHabitDateDays(int index) {
    if (selectedEndHabitIndex.value == index) return;

    selectedEndHabitIndex.value = index;

    if (selectedDate.value == null) {
      endHabitDatePickerController.text = getEndHabitPlaceholder();
      return;
    }

    if (index == 0) {
      // Date mode
      endHabitDatePickerController.text = DateClass.formatMonthDayYear(
        selectedDate.value!,
      );
    } else {
      // Days mode
      final today = normalize(DateTime.now());
      final selected = normalize(selectedDate.value!);

      final days = selected.difference(today).inDays;

      endHabitDatePickerController.text = 'After $days days';
    }
  }

  String getEndHabitPlaceholder() {
    return selectedEndHabitIndex.value == 0
        ? strSelectAnEndDate
        : strSelectDurationInDays;
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    final normalized = normalize(day);

    final exists = multiSelectedDays.any((d) => isSameDay(d, normalized));

    if (exists) {
      multiSelectedDays.removeWhere((d) => isSameDay(d, normalized));
    } else {
      multiSelectedDays.add(normalized);
    }

    this.focusedDay.value = focusedDay;
  }

  void onPerWeakClick(int value) {
    if (value == selectedPerWeak.value) {
      selectedPerWeak.value = -1;
    } else {
      selectedPerWeak.value = value;
    }
  }

  void onEndHabitOnDateChoose(String selectedDate) {
    endHabitDatePickerController.text = selectedDate;
  }

  void onSingleDaySelected(DateTime selected, DateTime focused) {
    selectedDate.value = normalize(selected);
    endHabitFocusedDay.value = focused;

    // Update text immediately
    onEndHabitDateDays(selectedEndHabitIndex.value);
  }

  void onWhenSingleDaySelected(DateTime selected, DateTime focused) {
    whenSelectedDate.value = normalize(selected);
    whenFocusedDay.value = focused;

    if (whenSelectedDate.value == null) {
      whenController.text = strPleaseSelectADate;
      return;
    }

    whenController.text = DateClass.formatMonthDayYear(whenSelectedDate.value!);
  }

  bool onSelectedDayPredicate(DateTime day) {
    final normalizeValue = normalize(day);
    return selectedDate.value == normalizeValue;
  }

  bool onWhenSelectedDayPredicate(DateTime day) {
    final normalizeValue = normalize(day);
    return whenSelectedDate.value == normalizeValue;
  }

  void handleEndHabitOnCancelClick() {
    selectedDate.value = null;
    endHabitDatePickerController.text = getEndHabitPlaceholder();
    Get.back();
  }

  void handleEndHabitOnOkClick() {
    if (selectedDate.value == null) {
      Toasts.warningToast(waring: strPleaseSelectADate);
      return;
    }

    final selected = normalize(selectedDate.value!);

    if (selectedEndHabitIndex.value == 0) {
      // Date mode
      endHabitDatePickerController.text = DateClass.formatMonthDayYear(
        selected,
      );
    } else {
      // Days mode
      final today = normalize(DateTime.now());
      final days = selected.difference(today).inDays;

      endHabitDatePickerController.text = 'Ends in $days days';
    }

    Get.back();
  }

  void handleWhenOnCancelClick() {
    selectedDate.value = null;
    whenController.text = strPleaseSelectADate;
    Get.back();
  }

  void handleWhenWidgetDateOnOkClick() {
    if (whenSelectedDate.value == null) {
      Toasts.warningToast(waring: strPleaseSelectADate);
      return;
    }

    final selected = normalize(whenSelectedDate.value!);

    whenController.text = DateClass.formatMonthDayYear(selected);

    Get.back();
  }

  void setEndHabitDatePickerControllerText() {
    if (selectedEndHabitIndex.value == 1 && selectedDate.value != null) {
      final today = normalize(DateTime.now());
      final selected = normalize(selectedDate.value!);

      final days = selected.difference(today).inDays;

      endHabitDatePickerController.text = 'After $days days';
    }
  }

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

  void onCancel() {
    Get.back();
  }

  void onOk() {}

  String? get getRepeatType {
    final index = selectedRepeatIndex.value;
    if (index < 0 || index >= _repeatTypes.length) {
      Toasts.errorToast(err: strPleaseChooseRepeatType);
      return null;
    }

    return _repeatTypes[index];
  }

  dynamic getRepeatDays() {
    final repeatType = getRepeatType;

    if (repeatType == null) {
      return;
    }

    if (repeatType == strDaily) {
      return selectedDayIndexList;
    } else if (repeatType == strWeekly) {
      return selectedPerWeak.value;
    } else {
      return multiSelectedDays.toList();
    }
  }

  String? doItAt() {
    final index = selectedDoItAtIndex.value;
    if (index < 0 || index >= _doItAtTypes.length) return null;
    return _doItAtTypes[selectedDoItAtIndex.value];
  }

  void onSave(bool isRegularHabit) {
    if (isRegularHabit) {
      if (!regularFormKey.currentState!.validate()) {
        Toasts.warningToast(waring: strFieldsCannotBeEmpty);
        return;
      }
    } else {
      if (!oneTimeFormKey.currentState!.validate()) {
        Toasts.warningToast(waring: strFieldsCannotBeEmpty);
        return;
      }
    }

    if (selectedDayIndexList.length == 0 && selectedRepeatIndex.value == 0) {
      Toasts.warningToast(waring: strPleaseChooseAtLeastOneDay);
      return;
    }
    if (selectedPerWeak.value == -1 && selectedRepeatIndex.value == 1) {
      Toasts.warningToast(waring: strPleaseChooseNumberOfDays);
      return;
    }

    if (multiSelectedDays.length == 0 && selectedRepeatIndex.value == 2) {
      Toasts.warningToast(waring: strPleaseChooseAtLeastOneDay);
      return;
    }

    String id =
        '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(999)}';

    if (isRegularHabit) {
      saveRegularHabit(id);
    }
  }

  void saveRegularHabit(String id) async {
    if (getRepeatType == null) return;
    if (regularHabitIconSelectedIndex.value == -1) {
      Toasts.errorToast(err: strPleaseChooseAnIcon);
      return;
    }

    print("Selected Color: ${selectedColor.value}");
    print("ARGB: ${selectedColor.value.toARGB32()}");
    print("HEX: ${selectedColor.value.toARGB32().toRadixString(16)}");

    /// TODO :: fix getRepeatDays;
    await LocalStorage.instance.addRegularHabit(
      RegularHabit(
        id: id,
        name: habitController.text,
        icon: EmojiList.icons[regularHabitIconSelectedIndex.value].emoji,
        color: selectedColor.value.toARGB32().toRadixString(16).padLeft(8, '0'),
        repeatType: getRepeatType!,
        repeatDays: getRepeatDays(),
        doItAt: doItAt(),
        endDate: selectedDate.value,
        reminderHour: reminderHour,
        reminderMinute: reminderMinute,
      ),
    );

    if (Get.isRegistered<HomeController>()) {
      HomeController.instance.loadHabits();
    }
    Get.back();
    Get.log(LocalStorage.instance.getLastHabit().toString());
    Toasts.successToast(msg: strSuccessfullyHabitAdded);
  }
}
