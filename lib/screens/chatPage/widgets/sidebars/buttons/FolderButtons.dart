import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/models/chatUserData/ChatFolder.dart';
import 'package:websitefluttertest/viewmodels/ChatFolderWM.dart';

import 'HoverButton.dart';

class FolderSettingsButton extends StatelessWidget {
  const FolderSettingsButton({Key? key}) : super(key: key);
  static const double itemHeightPercentage = 0.03;
  static const double maxButtonWidth = 22.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatFolderWM>(
      builder: (context, viewModel, _) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        double itemHeight = MediaQuery.of(context).size.height * itemHeightPercentage;

        return ListView.builder(
          itemCount: viewModel.folders.length,
          itemBuilder: (_, index) {
            ChatFolder folder = viewModel.folders[index];
            bool isClicked = viewModel.isFolderClicked(folder);

            return SizedBox(
              height: itemHeight,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: HoverButton(
                      child: Text(folder.name),
                      onTap: () => viewModel.toggleClickedFolders(folder),
                      isClicked: isClicked,
                    ),
                  ),
                  SizedBox(
                    width: maxButtonWidth,
                    child: HoverButton(
                      child: const Icon(Icons.edit, size: 17.5,),
                      onTap: () => _showCustomDialog(context, folder),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context, ChatFolder folder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), // Adjust radius size as needed
              topRight: Radius.circular(20), // Adjust radius size as needed
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(folder.name),
                ),
                body: Center(
                  // Your widget content here
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}


