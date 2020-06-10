import 'dart:io';

import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'repositories.dart';

String localIp = '192.168.0.8';

// NOTE Connect Dio to proxyman
Dio _proxyDio({String ip}) {
  String proxy = Platform.isAndroid ? '$ip:9090' : 'localhost:9090';
  Dio dio = new Dio();

  if (ip != null) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };
      
      // This is a workaround to allow Proxyman to receive
      // SSL payloads when your app is running on Android.
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    };
  }

  return dio;
}

final LoginRepository loginRepository = LoginRepository(
  apiProvider: ApiProvider(
    httpClient: _proxyDio(ip: localIp),
  )
);
