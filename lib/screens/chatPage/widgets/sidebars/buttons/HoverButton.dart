import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/models/chatUserData/ChatFolder.dart';
import 'package:websitefluttertest/viewmodels/ChatFolderWM.dart';

class HoverButton extends StatefulWidget {
  final Widget child;
  final Color hoverColor;
  final Color normalColor;
  final Color selectedColor;
  final VoidCallback? onTap;

  const HoverButton({
    Key? key,
    required this.child,
    this.hoverColor = Colors.lightBlue,
    this.normalColor = Colors.lightBlueAccent,
    this.selectedColor = Colors.deepPurple,
    this.onTap,
  }) : super(key: key);

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animation = ColorTween(begin: widget.normalColor, end: widget.hoverColor).animate(_controller);
  }

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        if (!_isSelected) {
          _controller.forward();
        }
      },
      onExit: (event) {
        if (!_isSelected) {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              _toggleSelected();
              widget.onTap?.call();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _isSelected ? widget.selectedColor : _animation.value,
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}


class DynamicButtonList extends StatelessWidget {
  final double itemHeightPercentage = 0.03;

  const DynamicButtonList({super.key}); // 3% of the screen height


  @override
  Widget build(BuildContext context) {
    return Consumer<ChatFolderWM>(
      builder: (context, viewModel, child) {
        double itemHeight = MediaQuery.of(context).size.height * itemHeightPercentage;

        // Checking if the data is loading
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Creating the list from the folders
        List<Widget> items = viewModel.folders.map((folder) {
          return HoverButton(
            child: Text(folder.name),
            onTap: () => viewModel.toggleSelectedFolder(folder),
            hoverColor: Colors.lightBlue[300]!,
            normalColor: Colors.lightBlue,
            selectedColor: Colors.deepPurple,
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

