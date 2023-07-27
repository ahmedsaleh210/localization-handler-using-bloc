import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_example/injector.dart' as di;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/langs.dart';

part 'app_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());

  void getLanguage() {
    final cachedLanguage = di.sl<SharedPreferences>().getString('language');
    if (cachedLanguage != null) {
      final locale = L10n.all
          .firstWhere((element) => element.languageCode == cachedLanguage);
      emit(state.copyWith(selectedLanguage: locale));
    } else {
      _getDeviceLanguage();
    }
  }

  void changeLanguage() {
    switch (currentLanguage) {
      case 'en':
        emit(state.copyWith(selectedLanguage: L10n.all[1]));
        break;
      case 'ar':
        emit(state.copyWith(selectedLanguage: L10n.all[0]));
        break;
    }
    di.sl<SharedPreferences>().setString('language', state.selectedLanguage.languageCode);
  }

  String get currentLanguage => Intl.getCurrentLocale();

  void _getDeviceLanguage() {
    for (final locale in L10n.all) {
      if (locale.languageCode == currentLanguage.split('_').first) {
        emit(state.copyWith(selectedLanguage: locale));
        return;
      }
    }
    emit(state.copyWith(selectedLanguage: L10n.all.first));
  }
}
