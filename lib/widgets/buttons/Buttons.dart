import 'package:flutter/material.dart';

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

