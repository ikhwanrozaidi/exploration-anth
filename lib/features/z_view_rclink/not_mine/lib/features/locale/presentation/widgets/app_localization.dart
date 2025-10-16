import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, dynamic> _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations._loadJsonLanguage();

    return localizations;
  }

  Future<void> _loadJsonLanguage() async {
    try {
      String jsonString = await rootBundle.loadString(
        'assets/translations/${locale.languageCode}.json',
      );
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap;
    } catch (e) {
      // Fallback
      String jsonString = await rootBundle.loadString(
        'assets/translations/en.json',
      );
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap;
    }
  }

  // Get translation by section and key
  String translateJson(String section, String key) {
    try {
      return _localizedStrings[section]?[key] ?? key;
    } catch (e) {
      return key;
    }
  }

  String shared(String key) {
    return translateJson('shared', key);
  }

  String main(String key) {
    return translateJson('main_screen', key);
  }

  String flavor(String key) {
    return translateJson('flavor_screen', key);
  }

  String auth(String key) {
    return translateJson('auth', key);
  }

  // Get nested translation with dot
  // Usage: localization.get('flavor_screen.flavorConfiguration') or localization.get('shared.submitButton')
  String get(String key) {
    try {
      List<String> keys = key.split('.');
      dynamic current = _localizedStrings;

      for (String k in keys) {
        current = current[k];
        if (current == null) return key;
      }

      return current.toString();
    } catch (e) {
      return key;
    }
  }

  // Get translation by using dot
  String getParams(String key, Map<String, String> params) {
    String text = get(key);

    params.forEach((paramKey, paramValue) {
      text = text.replaceAll('{$paramKey}', paramValue);
    });

    return text;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ms', 'ta', 'ur', 'bn'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
