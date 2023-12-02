
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';

const BASE_URL = "https://127.0.0.1:8000";

class createDio {
  static final createDio _instance = createDio._internal();
  late Dio dio;

  createDio._internal() {
    dio = Dio();
    dio.options.extra['withCredentials'] = true;
    dio.options.baseUrl = BASE_URL;
  }

  factory createDio() {
    return _instance;
  }
}



// This is for apps. Makes phone cookies act as web cookies (ish). Is removed for now.
Dio createDioWithCookieJar() {
  var dio = Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  return dio;
}
