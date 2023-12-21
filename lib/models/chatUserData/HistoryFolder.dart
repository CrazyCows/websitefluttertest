

class HistoryFolder {
  final int chat_id;
  final String title;
  // final String description;
  final List<int> folder_ids;
  bool isClicked = false;

  HistoryFolder({required this.chat_id, required this.title, required this.folder_ids});

  factory HistoryFolder.fromJson(Map<String, dynamic> json) {
    return HistoryFolder(
      chat_id: json['chat_id'] as int,
      title: json['title'] as String,
      folder_ids: json['folder_ids'] is List
          ? List<int>.from(json['folder_ids'].map((folder_id) => folder_id as int))
          : [],
    );
  }

}


class History {
  final int chat_id;
  final String text;
  final String type;

  History({required this.chat_id, required this.text, required this.type});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
    chat_id: json['chat_id'] as int,
    text: json['text'] as String,
    type: json['type'] as String,
    );
  }
}

