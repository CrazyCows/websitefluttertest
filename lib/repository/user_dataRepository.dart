import 'dart:convert';

import '../models/ChatFolder.dart';
import '../APIFetch/user_dataAPI.dart';

Future<List<ChatFolder>> fetchFolders() async {
  var jsonData = await fetchFoldersData();
  jsonData = jsonData['folders'] as List;
  if (jsonData is List) {
    return jsonData.map((item) => ChatFolder.fromJson(item)).toList();
  }
  return [];
}
