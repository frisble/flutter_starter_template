import 'package:flutter/material.dart';
import 'package:flutter_starter_template/config/extensions/l10n.dart';

extension ThemeModeX on ThemeMode {
  String themeModeName(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.l10n.system;
      case ThemeMode.light:
        return context.l10n.light;
      case ThemeMode.dark:
        return context.l10n.dark;
    }
  }
}
