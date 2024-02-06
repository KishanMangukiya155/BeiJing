import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class CartPageTopRow extends StatelessWidget {
  const CartPageTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // "<" IconButton
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
          icon: Container(
            height: size.height * 0.1,
            width: size.width * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: yellowColor, width: size.width * 0.005),
            ),
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
        ),

        // "Cart Food" Text
        const Text(
          "Cart Food",
          style: TextStyle(
            color: darkColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),

        // "..." IconButton
        IconButton(
          onPressed: () {},
          icon: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/images/dots.png"),
          ),
        ),
      ],
    );
  }
}
