import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  ColorDot({Key? key, required this.fillColor, required this.selected, required this.index})
      : super(key: key);

  Color fillColor;
  int selected, index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected == index ? fillColor : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}
