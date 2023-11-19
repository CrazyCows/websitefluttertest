import 'package:flutter/material.dart';
import 'package:websitefluttertest/view/chatPage/ChatPageActivity.dart';

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









