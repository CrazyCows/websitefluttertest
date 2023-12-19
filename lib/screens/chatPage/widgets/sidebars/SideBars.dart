import 'package:flutter/material.dart';
import 'buttons/FolderButtons.dart';
import 'buttons/HoverButton.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        child: FolderSettingsButton(),
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
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 13,
                        child: HistoryButtons(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RightSideBar extends StatelessWidget {
  const RightSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey,
            Colors.white12,
            Colors.white10,
          ],
          stops: [0.2, 0.5, 0.8],
          begin: Alignment.topCenter,
        ),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Text('hovernuttoon'),
            ),
          ],
        ),
      ),
    );
  }
}