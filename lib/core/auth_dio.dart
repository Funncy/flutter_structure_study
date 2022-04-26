import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Dio authDio() {
  var dio = Dio();

  const storage = FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    final token = await storage.read(key: 'token');

    options.headers['content-Type'] = 'application/json';
    options.headers['authorization'] = "Bearer $token";

    return handler.next(options);
  }));

  return dio;
}
