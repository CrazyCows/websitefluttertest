import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/models/chatUserData/HistoryFolder.dart';
import 'package:websitefluttertest/viewmodels/HistoryFolderWM.dart';

import 'HoverButton.dart';

class HistoryButtons extends StatelessWidget {
  static const double itemHeightPercentage = 0.03;

  const HistoryButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryFolderVM>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        double itemHeight = MediaQuery.of(context).size.height * itemHeightPercentage;

        return ListView.builder(
          itemCount: viewModel.historyFolders.length,
          itemBuilder: (_, index) {
            HistoryFolder folder = viewModel.historyFolders[index];
            bool isClicked = viewModel.isFolderClicked(folder);

            return SizedBox(
              height: itemHeight,
              child: HoverButton(
                onTap: () => viewModel.toggleClickedFolders(folder),
                isClicked: isClicked,
                child: Text(folder.title),
              ),
            );
          },
        );
      },
    );
  }

}