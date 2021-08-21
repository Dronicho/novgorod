import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
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

  Future<User?> register() async {
    // print(state.user.localImage);
    // var body =
    //     state.user.copyWith(photoUrl: state.user.localImage?.url).toJson();
    // print(body);
    // body.addAll({'password': state.password});
    // final res = await client.post(Uri.parse(api.baseUrl + '/user'), body: body);
    // final data = jsonDecode(res.body);
    // print(data);
    // if (data['message'] == 'ok') {
    //   storage.save(AUTH_SAVE_KEY, data['token']);
    //   _controller.add(AuthenticationStatus.authenticated);
    // }
  }

  Future<User?> logIn({
    required String username,
    required String password,
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
