import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<ColorScheme> schemes = [
  const ColorScheme.dark().copyWith(
    primary: Colors.black,
    onPrimary: const Color.fromRGBO(255, 255, 255, 1),
    secondary: Color.fromRGBO(242, 243, 246, 1),
    onSecondary: Colors.black,
    tertiary: Color.fromRGBO(116, 118, 131, 1),
  ),
  const ColorScheme.light().copyWith(
      primary: const Color.fromRGBO(14, 85, 250, 1),
      onPrimary: Colors.white,
      primaryContainer: const Color.fromRGBO(67, 136, 255, 1),
      secondary: const Color.fromRGBO(11, 95, 251, 1),
      onSecondary: Colors.white),
];

class AppThemeNotifier extends StateNotifier<ThemeData> {
  AppThemeNotifier() : super(ThemeData.light(useMaterial3: true));

  void changeColorScheme(int index) {
    state = state.copyWith(colorScheme: schemes[index]);
  }
}

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, ThemeData>((ref) {
  return AppThemeNotifier();
});
