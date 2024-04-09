import 'package:flutter_starter_template/api/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

class AuthenticationRepository {
  AuthenticationRepository({required this.apiClient});

  final ApiClient apiClient;

  Future<void> login() async {}
}

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepository(
    apiClient: ApiClient(),
  );
}
