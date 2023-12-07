import 'dart:js';

import 'package:flutter/material.dart';
import 'package:websitefluttertest/screens/chatPage/widgets/buttons/FolderButtons.dart';

import '../../APIFetch/loginAPI.dart';
import 'widgets/navigationBar/navigation_bar.dart';
import 'widgets/sidebars/SideBars.dart';

void fetchButtonData() async {
  await loginTest();
}


class ChatPage extends StatefulWidget{
  const ChatPage({super.key});


  @override
  State<ChatPage> createState() => _ChatPage();
}


class _ChatPage extends State<ChatPage> {

  @override
  void initState() {
    super.initState();
    fetchButtonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: NavBar(),
          ),
          Expanded(
            flex: 20,
            child: Container(
              padding: const EdgeInsets.all(0),
              color: Colors.white,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: LeftSideBar(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: const Center(
                        child: SelectableText("chatpage incoming"),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: RightSideBar(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


