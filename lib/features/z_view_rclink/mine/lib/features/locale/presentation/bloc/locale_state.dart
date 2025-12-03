import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'locale_state.freezed.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const LocaleState._();

  const factory LocaleState({required Locale locale}) = _LocaleState;

  factory LocaleState.initial({@Default(Locale('en', '')) Locale locale}) =
      LocaleInitial;

  String get currentLanguageName {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ms':
        return 'Malay';
      case 'ta':
        return 'Tamil';
      case 'ur':
        return 'Urdu';
      case 'bn':
        return 'Bengali';
      default:
        return 'English';
    }
  }

  String get currentLanguageFlag {
    switch (locale.languageCode) {
      case 'en':
        return '🇺🇸';
      case 'ms':
        return '🇲🇾';
      case 'ta':
        return '🇮🇳';
      case 'ur':
        return '🇵🇰';
      case 'bn':
        return '🇧🇩';
      default:
        return '🇺🇸';
    }
  }

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ms', ''),
    Locale('ta', ''),
    Locale('ur', ''),
    Locale('bn', ''),
  ];

  static const Map<String, String> languageFlags = {
    'en': '🇺🇸',
    'ms': '🇲🇾',
    'ta': '🇮🇳',
    'ur': '🇵🇰',
    'bn': '🇧🇩',
  };

  static const Map<String, String> languageNames = {
    'en': 'English',
    'ms': 'Malay',
    'ta': 'Tamil',
    'ur': 'Urdu',
    'bn': 'Bengali',
  };

  // @override
  // // TODO: implement locale
  // Locale get locale => throw UnimplementedError();
}
