import 'package:dio/dio.dart';
import '../APIConnections/createDioCon.dart';

Future<dynamic> fetchUserData(String path) async {
  final Dio dio = createDio().dio;

  try {
    final response = await dio.get(
      '/user_resource/user/$path/',
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


