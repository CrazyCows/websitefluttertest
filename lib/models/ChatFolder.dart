
class ChatFolder {
  final int id;
  final String name;

  ChatFolder({required this.id, required this.name});

  factory ChatFolder.fromJson(Map<String, dynamic> json) {
    return ChatFolder(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class ChatFolders {
  final List<ChatFolder> folderData;

  ChatFolders({required this.folderData});

  List<ChatFolder> getFolders(){
    return folderData;
  }


  factory ChatFolders.fromJson(Map<String, dynamic> json){
    List<ChatFolder> folders = json.values.map((folderJson) {
      return ChatFolder.fromJson(folderJson);
    }).toList();

    return ChatFolders(
        folderData: folders
    );
  }
}
