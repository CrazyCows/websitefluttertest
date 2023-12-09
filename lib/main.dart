import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/screens/chatPage/ChatPageActivity.dart';
import 'package:websitefluttertest/viewmodels/ChatFolderWM.dart';
import 'package:websitefluttertest/viewmodels/HistoryFolderWM.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatFolderWM()),
        ChangeNotifierProvider(create: (context) => HistoryFolderVM()),
        // Add more providers here as needed
      ],
      child: ChatApp(),
    );
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/': (context) => const ChatPage(),
      },
    );
  }
}











