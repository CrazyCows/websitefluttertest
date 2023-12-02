import 'package:dio/dio.dart';
import '../APIConnections/createDioCon.dart';

Future<void> loginTest() async {
  final Dio dio = createDio().dio;


  const String username = 'test1';
  const String password = 'test2';

  try {
    final response = await dio.post(
      '/auth/users/login/',
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