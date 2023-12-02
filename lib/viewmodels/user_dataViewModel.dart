import 'package:flutter/material.dart';
import 'package:websitefluttertest/models/ChatFolder.dart';
import '../repository/user_dataRepository.dart';


class ViewModeluser_data extends ChangeNotifier {
    List<ChatFolder> _folders = [];
    bool _isLoading = true;

    List<ChatFolder> get folders => _folders;
    bool get isLoading => _isLoading;


  ViewModeluser_data(){
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


}
