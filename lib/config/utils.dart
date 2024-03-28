import 'package:flutter_starter_template/config/enum/flavor.dart';
import 'package:flutter_starter_template/constants/default_keys.dart';

abstract class Utils {
  static bool get isDev =>
      const String.fromEnvironment('FLAVOR',
          defaultValue: DefaultKeys.flavor) ==
      Flavor.dev.key;
}
