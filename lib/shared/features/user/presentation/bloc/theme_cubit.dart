import 'package:app_posto/utils/themes.dart';
import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<Themes> {
  static const double minhFontScale = 0.8;
  static const double maxFontScale = 2.0;

  ThemeCubit() : super(Themes.initial);

  void changeTheme({bool? isDark}) {
    final bool newIsDark = isDark ?? !state.isDarkMode;
    emit(state.copyWith(isDarkMode: newIsDark));
  }

  void changeFontSize(double fontScale) {
    final clampedScale = fontScale.clamp(minhFontScale, maxFontScale);
    emit(state.copyWith(fontScale: clampedScale));
  }

  void increaseFontSize() {
    changeFontSize(state.fontScale + 0.1);
  }

  void decreaseFontSize() {
    changeFontSize(state.fontScale - 0.1);
  }
}
