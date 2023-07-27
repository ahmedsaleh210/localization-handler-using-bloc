part of 'app_cubit.dart';

class LanguageState {
  LanguageState({selectedLanguage})
      : selectedLanguage = selectedLanguage ?? L10n.all.first;
  final Locale selectedLanguage;

  LanguageState copyWith({Locale? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
