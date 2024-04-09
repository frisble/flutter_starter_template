import 'package:flutter/material.dart';

sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class NotFoundException extends APIException {
  NotFoundException() : super('Not found');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}

class NotAuthorizedException extends APIException {
  final dynamic data;
  NotAuthorizedException([this.data]) : super('Not authorized');
}

class ConflictException extends APIException {
  final dynamic data;
  ConflictException([this.data]) : super('Conflict');
}

class BadRequestException extends APIException {
  BadRequestException() : super('Bad request');
}

class UserNotRegisteredException extends APIException {
  // final AuthCredential authCredential;
  UserNotRegisteredException() : super('message.userNotRegistered');
}

class NicknameNotAvailableException extends APIException {
  NicknameNotAvailableException() : super('Nickname not available');
}

class EventNotFoundException extends APIException {
  EventNotFoundException() : super('Event not found');
}

class OrganizationNameNotAvailableException extends APIException {
  OrganizationNameNotAvailableException()
      : super('Organization name not available');
}

class LogoutException implements Exception {
  LogoutException() : super();
}

extension ApiExceptionX on APIException {
  String message(BuildContext context) {
    switch (this) {
      case NoInternetConnectionException():
      case NotFoundException():
      case UnknownException():
      case NotAuthorizedException():
      case ConflictException():
      case BadRequestException():
      case UserNotRegisteredException():
      case NicknameNotAvailableException():
      case OrganizationNameNotAvailableException():
      case EventNotFoundException():
        return '';
    }
  }
}
