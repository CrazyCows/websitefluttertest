import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Widget child;
  final Color hoverColor;
  final Color normalColor;
  final Color selectedColor;
  final VoidCallback? onTap;
  final bool isClicked;

  const HoverButton({
    Key? key,
    required this.child,
    this.hoverColor = Colors.lightBlue,
    this.normalColor = Colors.lightBlueAccent,
    this.selectedColor = Colors.deepPurple,
    this.onTap,
    this.isClicked = false,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600), // Duration of the fade animation
    );

    _colorAnimation = ColorTween(
      begin: widget.normalColor,
      end: widget.hoverColor,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _animationController.forward(),
      onExit: (_) => _animationController.reverse(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.isClicked ? widget.selectedColor : _colorAnimation.value,
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}



