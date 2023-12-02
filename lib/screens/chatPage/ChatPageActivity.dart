import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/screens/chatPage/widgets/buttons/ButtonsDynamicLists.dart';
import 'package:websitefluttertest/viewmodels/user_dataViewModel.dart';

import '../../APIFetch/loginAPI.dart';
import 'widgets/navigationBar/navigation_bar.dart';

void fetchButtonData() async {
  await loginTest();
}


class ChatPage extends StatefulWidget{
  const ChatPage({super.key});

  @override
  _ChatPage createState() => _ChatPage();
}



class _ChatPage extends State<ChatPage> {

  @override
  void initState(){
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: SelectableText("data"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 13,
                                  child: DynamicButtonList(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text("data2"),
                                      )
                                  ),
                                ),
                                Expanded(
                                  flex: 13,
                                  child: DynamicButtonList(

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.black, width: 1),
                            right: BorderSide(
                              color: Colors.black,
                              width: 1,
                            )),
                      ),
                      child: const Center(
                        child: SelectableText("chatpage incoming"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white12, Colors.white10],
                              stops: [0.2, 0.5, 0.8],
                              begin: Alignment.topCenter)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Expanded(
                              child: Text("hovernuttoon"),
                            )
                          ],
                        ),
                      ),
                    ),
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

