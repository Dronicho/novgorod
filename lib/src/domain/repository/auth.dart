import 'dart:async';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/base.dart';

import '../constants.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  authenticatedFirstTime
}

class AuthenticationRepository extends BaseRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield await _trySavedLogin();
    yield* _controller.stream;
  }

  Future<AuthenticationStatus> _trySavedLogin() async {
    final token = storage.prefs.getString(AUTH_SAVE_KEY);
    print(token);
    if (token != null && token.isNotEmpty) {
      return AuthenticationStatus.authenticated;
    }
    return AuthenticationStatus.unauthenticated;
  }

  Future<void> updateUser(
      {required String name,
      required String lastName,
      required String sex,
      required List<String> clubs,
      bool updateFirstTime = false}) async {
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> register(String username, String phone) async {
    final res = await api.client
        .post(api.baseUrl + '/user', data: {'name': username, 'phone': phone});
    if (res.data['message'] == 'ok') {
      await storage.prefs.setString(AUTH_SAVE_KEY, res.data['token']);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  Future<User?> logIn({
    required String username,
  }) async {
    final res =
        await api.client.post(api.baseUrl + '/auth', data: {'phone': username});
    print(res.data);
    if (res.data['message'] != 'ok') {
      return null;
    }
    if (res.statusCode == 200) {
      final token = res.data['token'];
      await storage.prefs.setString(AUTH_SAVE_KEY, token);
      _controller.add(AuthenticationStatus.authenticated);
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    storage.prefs.remove(AUTH_SAVE_KEY);
  }

  void dispose() => _controller.close();
}
