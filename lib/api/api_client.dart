import 'package:dio/dio.dart';
import 'package:flutter_starter_template/api/exceptions/api_exceptions.dart';

class ApiClient {
  late Dio client;

  final BaseOptions opts = BaseOptions(
    responseType: ResponseType.json,
  );

  Dio createDio() {
    return Dio(opts);
  }

  InterceptorsWrapper get interceptorWrapper => InterceptorsWrapper(
        onRequest: (options, handler) async {
          /* if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          } */
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
      );

  ApiClient() {
    client = createDio();
    client.interceptors.add(interceptorWrapper);
  }

  Future<T> getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.getUri(uri);
      return builder(response.data);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<T> postData<T>({
    required Uri uri,
    required Object data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.postUri(uri, data: data);
      return builder(response.data);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<T> patchData<T>({
    required Uri uri,
    required Object data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.patchUri(uri, data: data);
      return builder(response.data);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<T> putData<T>({
    required Uri uri,
    required Object data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.putUri(uri, data: data);
      return builder(response.data);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      throw UnknownException();
    }
  }

  Future<void> deleteData<T>({
    required Uri uri,
  }) async {
    try {
      await client.deleteUri(uri);
      return;
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      throw UnknownException();
    }
  }

  handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw NoInternetConnectionException();
      case DioExceptionType.sendTimeout:
        throw NoInternetConnectionException();
      case DioExceptionType.receiveTimeout:
        throw NoInternetConnectionException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw NotAuthorizedException(error.response?.data);
          case 404:
            throw NotFoundException();
          case 409:
            throw ConflictException(error.response?.data);
          default:
            throw UnknownException();
        }
      case DioExceptionType.cancel:
        break;
      default:
        throw BadRequestException();
    }
  }
}
