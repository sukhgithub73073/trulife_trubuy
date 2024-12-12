part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeEnum themeEnum;

  const ChangeThemeEvent({required this.themeEnum});

  @override
  // TODO: implement props
  List<Object?> get props => [themeEnum];
}
