import 'dart:io';

import 'package:flutter/material.dart';
import 'package:websitefluttertest/models/chatUserData/HistoryFolder.dart';
import '../repository/user_dataRepository.dart';


class HistoryFolderVM extends ChangeNotifier {
  final List<HistoryFolder> _historyFolders = [];
  final List<HistoryFolder> _selectedHistoryFolders = [];
  bool _isLoading = true;

  List<HistoryFolder> get historyFolders => _historyFolders;
  List<HistoryFolder> get getSelectedFolders => _selectedHistoryFolders;
  bool get isLoading => _isLoading;


  HistoryFolderVM(){
    loadFolders();
  }

  void loadFolders() async{
    _isLoading = true;
    try {
      var historyJson = await fetchHistoryFolders();
      _historyFolders.clear();
      _historyFolders.addAll(historyJson);


    } catch (error) {
      print(error);
    }
    finally {
      print("lala");
      print(_historyFolders);
      _isLoading = false;

    }
  }
}
