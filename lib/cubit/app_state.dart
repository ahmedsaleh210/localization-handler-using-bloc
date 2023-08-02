
part of 'app_cubit.dart';


class LanguageState extends Equatable {
  LanguageState({selectedLanguage})
      : selectedLanguage = selectedLanguage ?? Language.en.value;
  final Locale selectedLanguage;

  LanguageState copyWith({Locale? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object> get props => [selectedLanguage];
}
