import 'dart:io';

import 'package:flutter/material.dart';
import 'package:websitefluttertest/models/chatUserData/ChatFolder.dart';
import '../repository/user_dataRepository.dart';


class ChatFolderWM extends ChangeNotifier {
    final List<ChatFolder> _folders = [];
    bool _isLoading = true;

    List<ChatFolder> get folders => _folders;
    bool get isLoading => _isLoading;

    ChatFolderWM(){
      loadFolders();
    }



    void loadFolders() async {
      _folders.clear();
      setLoading(true);
      try {
        var foldersJson = await fetchFolders();
        _folders.clear();
        _folders.addAll(foldersJson);
        print(foldersJson);
        notifyListeners();
      } catch (error){
        var _errormessage = error.toString();
        print(_errormessage);
      } finally {
        setLoading(false);
      }
    }

    void setLoading(bool loading) {
      _isLoading = loading;
      notifyListeners();
    }

    void toggleClickedFolders(ChatFolder folder) {
      folder.isClicked = !folder.isClicked;
      print(folder.isClicked);
      notifyListeners();
    }

    bool isFolderClicked(ChatFolder folder) {
      return folder.isClicked;
    }

}
