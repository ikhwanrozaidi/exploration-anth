import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocale extends LocaleEvent {
  final Locale locale;

  const ChangeLocale(this.locale);

  @override
  List<Object> get props => [locale];
}

class LoadSavedLocale extends LocaleEvent {
  const LoadSavedLocale();
}
