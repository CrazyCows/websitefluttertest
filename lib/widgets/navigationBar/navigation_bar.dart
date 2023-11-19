import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // This could be your custom navigation bar
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 1,
              child:
              Align(alignment: Alignment.centerLeft, child: FlutterLogo())),
          Expanded(flex: 10, child: Center(child: SelectableText("Selectors"))),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight, child: Text("Picture"))),
        ],
      ),
    );
  }
}