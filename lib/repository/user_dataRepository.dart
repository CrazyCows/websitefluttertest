import 'dart:convert';

import '../models/chatUserData/ChatFolder.dart';
import '../APIFetch/user_dataAPI.dart';

Future<List<ChatFolder>> fetchFolders() async {
  var jsonData = await fetchUserData('get-folders');
  jsonData = jsonData['folders'] as List;
  if (jsonData is List) {
    return jsonData.map((item) => ChatFolder.fromJson(item)).toList();
  }
  return [];
}

/*
Future<List<ChatFolder>> fetchHistory() async {
  var jsonData = await fetchUserData('chat-history');
  jsonData = jsonData['chat_history'];
}
 */