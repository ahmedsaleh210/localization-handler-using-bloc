import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_example/injector.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/langs.dart';

part 'app_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());

  void getLanguage() {
    final cachedLanguage = serviceLocator<SharedPreferences>().getString('language');
    if (cachedLanguage != null) {
      final locale = Language.fromString(cachedLanguage);
      emit(state.copyWith(selectedLanguage: locale.value));
    } else {
      _getDeviceLanguage();
    }
  }

  void changeLanguage() {
    log(currentLanguage);
    switch (currentLanguage) {
      case 'en':
        emit(state.copyWith(selectedLanguage: Language.ar.value));
        break;
      case 'ar':
        emit(state.copyWith(selectedLanguage: Language.en.value));
        break;
    }
    serviceLocator<SharedPreferences>()
        .setString('language', state.selectedLanguage.languageCode);
  }

  String get currentLanguage => Intl.getCurrentLocale();

  void _getDeviceLanguage() {
    for (final locale in Language.values) {
      if (locale.value.languageCode == currentLanguage.split('_').first) {
        emit(state.copyWith(selectedLanguage: locale.value));
        return;
      }
    }
    emit(state.copyWith(selectedLanguage: Language.en.value));
  }
}
