import 'package:built_value/built_value.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  String get username;

  factory AppUser([Function(AppUserBuilder) updates]) = _$AppUser;
  AppUser._();
}
