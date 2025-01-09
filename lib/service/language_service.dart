// ignore_for_file: collection_methods_unrelated_type

import 'dart:ui';

import 'package:otm_template/utils/local_cache.dart';

enum AppLanguage { vi, en }

class LanguageService {
  // ignore: prefer_final_fields
  static String _keyCahe = "lazu-language-code";
  static String pathTrans = "assets/translations";

  LanguageService._();

  factory LanguageService() => _instance;

  static LanguageService get _instance => LanguageService._();

  static Map<AppLanguage, Locale> supportedLocales = {
    AppLanguage.vi: const Locale('vi', 'VI'),
    AppLanguage.en: const Locale('en', 'US'),
  };

  /// update app language by code language for example (en,ar..etc)
  static Future<void> changeLanguage(AppLanguage appLanguage, context) async {
    // check if the language is supported
    if (!supportedLocales.keys.contains(appLanguage)) return;
    // update current language in shared pref
    String languageCode = supportedLocales[appLanguage]!.languageCode;
    LocalCache.put(_keyCahe, languageCode);
    context.setLocale(supportedLocales[languageCode]);
  }

  /// get current locale
  static Locale getCurrentLocal() {
    try {
      String? languageCode = LocalCache.get(_keyCahe) as String?;
      return supportedLocales[languageCode]!;
    } catch (e) {}

    return supportedLocales.values.first;
  }
}
