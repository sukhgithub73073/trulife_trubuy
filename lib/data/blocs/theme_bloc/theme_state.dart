part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
}

final class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

final class ThemeLoading extends ThemeState {
  @override
  List<Object> get props => [];
}

final class ThemeDark extends ThemeState {
  @override
  List<Object> get props => [];
}
final class ThemeLight extends ThemeState {
  @override
  List<Object> get props => [];
}

