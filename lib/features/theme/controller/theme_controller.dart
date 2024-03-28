import 'package:flutter/material.dart';
import 'package:flutter_starter_template/constants/preference_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<ThemeMode> build() async {
    final SharedPreferences prefs = await _prefs;
    final currentTheme = prefs.getString(PreferenceKey.themeMode);
    switch (currentTheme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(PreferenceKey.themeMode, themeMode.name);
    state = AsyncValue.data(themeMode);
  }
}
