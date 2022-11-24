import 'package:flutter/material.dart';
import 'package:karostartup/constants.dart';

class AddCart extends StatelessWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          items(Icons.chat, "Chat"),
          items(Icons.shopping_bag_outlined, "Add to Cart"),
        ],
      ),
    );
  }

  items(IconData icon, String data) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: bgColor,
          ),
          const SizedBox(width: 5),
          Text(
            data,
            style: const TextStyle(color: bgColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
