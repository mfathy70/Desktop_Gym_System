import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String? currentLang;
  Locale? locale;

  void changeToEN(BuildContext context) {
    EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    currentLang = "en";
    locale = const Locale('en', 'US');
    print(locale);
    notifyListeners();
  }

  void changeToAR(BuildContext context) {
    EasyLocalization.of(context)!.setLocale(const Locale('ar', 'AR'));
    currentLang = "ar";
    locale = const Locale('ar', 'AR');
    print(locale);
    notifyListeners();
  }
}
