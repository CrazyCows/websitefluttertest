import 'package:flutter/material.dart';
import 'package:websitefluttertest/widgets/navigationBar/navigation_bar.dart';
import 'package:websitefluttertest/widgets/buttons/Buttons.dart';
import 'package:websitefluttertest/widgets/buttons/ButtonsDynamicLists.dart';

class StandardBackground extends StatelessWidget {
  const StandardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Column(
        children: [
          Expanded(
            flex: 1,
            child: NavBar(),
          ),
          Expanded(flex: 20, child: ChatPage())
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            child: const Center(
                              child: SelectableText("data"),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 13,
                          child: DynamicButtonList(
                              items: [HoverButton(text: "text"), HoverButton(text: "text2")]
                          ),
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
                                child: Text("data"),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 13,
                          child: DynamicButtonList(
                              items: [
                                ...List.generate(30, (index) => HoverButton(text: "Button ${index + 1}")),
                              ]
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
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

