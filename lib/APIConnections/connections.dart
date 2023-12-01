import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';


const BASE_URL = "https://127.0.0.1:8000";


// This is for apps. Makes phone cookies act as web cookies (ish). Is removed for now.
Dio createDioWithCookieJar() {
  var dio = Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  return dio;
}



Future<void> loginTest() async {
  final Dio dio = Dio();


  const String username = 'test1';
  const String password = 'test2';

  try {
    final response = await dio.post(
      '$BASE_URL/auth/users/login/',
      data: {'user_name': username, 'user_password': password},
      options: Options(
          contentType: Headers.jsonContentType,
      ),

    );
    if (response.statusCode == 200) {
      final user = response.data['user'];
      print(user);
      // The cookies are automatically managed by Dio and CookieJar
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (error) {
    print(error);
  }
}


Future<dynamic> fetchFolders() async {
  final Dio dio = Dio();

  try {
    final response = await dio.post(
      '$BASE_URL/auth/users/login/',
      options: Options(
        contentType: Headers.jsonContentType,
      ),

    );
    if (response.statusCode == 200) {
      return response.data;
      // The cookies are automatically managed by Dio and CookieJar
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (error) {
    print(error);
  }
  return [];
}


