import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/screens/chatPage/widgets/buttons/Buttons.dart';
import 'package:websitefluttertest/viewmodels/user_dataViewModel.dart';


class DynamicButtonList extends StatelessWidget {
  final double itemHeightPercentage = 0.03; // 3% of the screen height


  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModeluser_data>(
      builder: (context, viewModel, child) {
        double itemHeight = MediaQuery.of(context).size.height * itemHeightPercentage;

        // Checking if the data is loading
        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // Creating the list from the folders
        List<Widget> items = viewModel.folders.map((folder) {
          return HoverButton(
            text: folder.name,
          );
        }).toList();

        // Building the ListView with the folders
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: itemHeight,
              child: items[index],
            );
          },
        );
      },
    );
  }
}