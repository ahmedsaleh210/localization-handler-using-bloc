import 'package:flutter/material.dart';

enum Language {
  en(Locale('en'), "English"),
  ar(Locale('ar'), "العربية");

  final Locale value;
  final String title;

  const Language(this.value, this.title);

  static Language fromString(String? value) {
    return Language.values
        .firstWhere((element) => element.value.languageCode == value);
  }

  static List<Locale> get supportedLocales =>
      Language.values.map((e) => e.value).toList();

  static List<String> get titles =>
      Language.values.map((e) => e.title).toList();
}
