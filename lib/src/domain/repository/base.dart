import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_map/src/domain/constants.dart';

class BaseRepository {
  final api = GetIt.I<Api>();
  final storage = GetIt.I<Storage>();
}

class Api {
  final client = Dio();
  final baseUrl = 'https://1be8bbb3c265.ngrok.io';
  final _storage = GetIt.I<Storage>();

  Future<Api> init() async {
    client.interceptors.add(InterceptorsWrapper(onRequest: (options, next) {
      options.headers['Authorization'] =
          'Bearer ${_storage.prefs.getString(AUTH_SAVE_KEY)}';
      print(_storage.prefs.getString(AUTH_SAVE_KEY));
      next.next(options);
    }));
    return this;
  }
}

class Storage {
  late SharedPreferences prefs;

  Future<Storage> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }
}
