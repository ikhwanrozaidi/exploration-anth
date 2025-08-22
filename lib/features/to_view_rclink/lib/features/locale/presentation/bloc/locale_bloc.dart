import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale_event.dart';
import 'locale_state.dart';

@lazySingleton
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeKey = 'saved_locale';

  LocaleBloc() : super(LocaleState.initial()) {
    on<ChangeLocale>(_onChangeLocale);
    on<LoadSavedLocale>(_onLoadSavedLocale);
  }

  void _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) async {
    if (LocaleState.supportedLocales.contains(event.locale)) {
      emit(state.copyWith(locale: event.locale));
      await _saveLocale(event.locale);
    }
  }

  void _onLoadSavedLocale(
    LoadSavedLocale event,
    Emitter<LocaleState> emit,
  ) async {
    final savedLocale = await _loadLocale();
    if (savedLocale != null) {
      emit(state.copyWith(locale: savedLocale));
    }
  }

  Future<void> _saveLocale(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
    } catch (e) {
      log('Error saving locale: $e');
    }
  }

  Future<Locale?> _loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_localeKey);
      if (languageCode != null) {
        return Locale(languageCode, '');
      }
    } catch (e) {
      log('Error loading locale: $e');
    }
    return null;
  }
}
