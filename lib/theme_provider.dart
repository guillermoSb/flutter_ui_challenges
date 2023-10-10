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
