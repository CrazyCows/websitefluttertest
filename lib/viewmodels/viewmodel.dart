import 'package:flutter/material.dart';
import 'package:websitefluttertest/models/ChatFolder.dart';
import 'package:websitefluttertest/APIConnections/connections.dart';
import 'package:dio/dio.dart';

class ChatPageViewModel extends ChangeNotifier {


    List<ChatFolder> _folders = [];
    bool _isLoading = true;

    List<ChatFolder> get folders => _folders;
    bool get isLoading => _isLoading;

    void setFolders(List<ChatFolder> folders) {
      _folders = folders;
      notifyListeners();
    }

    void setLoading(bool loading) {
      _isLoading = loading;
      notifyListeners();
    }

    Future<void> loadFolders() async {
      setLoading(true);
      try {
        var response = await fetchFolders();

        _folders = List<ChatFolder>.from(response.map((x) => ChatFolder.fromJson(x)));
        notifyListeners();

      } catch (error) {
        print(error);
      } finally {
        setLoading(false);
      }
    }
}
