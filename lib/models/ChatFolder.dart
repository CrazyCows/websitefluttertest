
class ChatFolder {
  final Map<String, dynamic> folderData;

  ChatFolder({required this.folderData});
}

class ChatFolders {
  final List<ChatFolder> folderData;

  ChatFolders({required this.folderData});

  List<ChatFolder> getFolders(){
    return folderData;
  }

  factory ChatFolders.fromJson(Map<String, dynamic> json){
    List<ChatFolder> folders = json.entries.map((entry) {
      return ChatFolder(folderData: {entry.key: entry.value});
    }).toList();

    return ChatFolders(
        folderData: folders
    );
  }
}
