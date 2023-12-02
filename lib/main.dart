import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/screens/chatPage/ChatPageActivity.dart';
import 'package:websitefluttertest/viewmodels/user_dataViewModel.dart';

void main() => runApp(
  ChangeNotifierProvider(
      create: (context) => ViewModeluser_data(),
      child: const ChatApp()
  )
);



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











