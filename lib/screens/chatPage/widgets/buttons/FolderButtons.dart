import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websitefluttertest/viewmodels/user_dataViewModel.dart';

class HoverButton extends StatefulWidget {
  final String text;

  const HoverButton({Key? key, required this.text}) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    // Adjust these colors as needed for your hover effect
    _animation = ColorTween(begin: Colors.lightBlue[300], end: Colors.lightBlue)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _controller.forward(),
      onExit: (event) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(

            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: _animation.value,
            ),
            child: child,
          );
        },
        child: InkWell(
          onTap: () {
            // Handle tap if necessary
          },
          child: Center(
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}

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

