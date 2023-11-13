import 'package:flutter/material.dart';

class DynamicButtonList extends StatelessWidget {
  final List<Widget> items;
  final double itemHeightPercentage = 0.03; // 4% of the screen height

  const DynamicButtonList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height * itemHeightPercentage;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: itemHeight,
          child: items[index],
        );
      },
    );
  }
}