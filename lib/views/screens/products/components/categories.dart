import 'package:flutter/material.dart';


class Categories extends StatefulWidget {
  Categories({
    Key? key,
    required this.categories,
    required this.onChanged,
  }) : super(key: key);

  List<String> categories;
  ValueChanged onChanged;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /// this has been used to detect the selected index from the category
                /// name to sort them by the category
                setState(() {
                  selectedIndex = index;
                  widget.onChanged(index);
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  right: index == widget.categories.length - 1 ? 30 : 0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.categories[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
