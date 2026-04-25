import 'package:get/get.dart';

import '../app/core/translations/en_US.dart';
import '../app/core/translations/hi_IN.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'hi_IN': hiIN,
  };
}