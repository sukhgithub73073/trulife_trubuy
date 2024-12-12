import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trubuy/all_enums/theme_enum.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeThemeEvent>(_changeTheme);
  }

  FutureOr<void> _changeTheme(
      ChangeThemeEvent event, Emitter<ThemeState> emit) {
    emit(ThemeLoading());
    emit(event.themeEnum == ThemeEnum.dark ? ThemeDark() : ThemeLight());
  }
}
