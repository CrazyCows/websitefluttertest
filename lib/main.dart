import 'package:flutter/material.dart';
import 'package:websitefluttertest/screens/chatPage/ChatPageActivity.dart';

void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/': (context) => const ChatPageLaunch(),
      },
    );
  }
}

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}









