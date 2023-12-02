
class ChatFolder {
  final int id;
  final String name;

  ChatFolder({required this.id, required this.name});

  factory ChatFolder.fromJson(Map<String, dynamic> json) {
    return ChatFolder(
      id: json['id'] as int,
      name: json['folder_name'] as String,
    );
  }
}


