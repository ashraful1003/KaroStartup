import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'color_dot.dart';

class ListOfColors extends StatefulWidget {
  ListOfColors({Key? key}) : super(key: key);

  @override
  State<ListOfColors> createState() => _ListOfColorsState();
}

class _ListOfColorsState extends State<ListOfColors> {
  List<Color> colors = [Colors.grey, primary, secondary];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 216,
        height: 24,
        alignment: Alignment.center,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: ColorDot(
                  fillColor: colors[index],
                  selected: selected,
                  index: index,
                ),
              );
            }),
      ),
    );
  }
}

/*
Padding(
padding: const EdgeInsets.symmetric(vertical: 20),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ColorDot(
fillColor: Colors.grey,
isSelected: true,
),
ColorDot(
fillColor: secondary,
),
ColorDot(
fillColor: primary,
),
],
),
)
*/
