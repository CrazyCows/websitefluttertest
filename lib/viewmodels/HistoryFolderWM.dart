import 'dart:io';

import 'package:flutter/material.dart';
import 'package:websitefluttertest/models/chatUserData/HistoryFolder.dart';
import '../repository/user_dataRepository.dart';


class HistoryFolderVM extends ChangeNotifier {
  final List<HistoryFolder> _historyFolders = [];
  bool _isLoading = true;

  List<HistoryFolder> get historyFolders => _historyFolders;
  bool get isLoading => _isLoading;


  HistoryFolderVM(){
    loadFolders();
  }

  void loadFolders() async{
    setLoading(true);
    try {
      var historyJson = await fetchHistoryFolders();
      _historyFolders.clear();
      _historyFolders.addAll(historyJson);
    } catch (error) {
      print(error);
    }
    finally {
      setLoading(false);
    }
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void toggleClickedFolders(HistoryFolder folder) {
    _historyFolders.forEach((element) {element.isClicked = false;});
    folder.isClicked = true;
    print(folder.isClicked);
    notifyListeners();
  }

  bool isFolderClicked(HistoryFolder folder) {
    return folder.isClicked;
  }
}
