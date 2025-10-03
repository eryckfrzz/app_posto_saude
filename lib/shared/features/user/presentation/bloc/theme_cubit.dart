import 'package:app_posto/utils/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(Themes.getColor('default'));

  void changeTheme(String theme) {
    emit(Themes.getColor(theme));
  }
}
