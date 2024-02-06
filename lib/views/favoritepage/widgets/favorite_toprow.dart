import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/styles.dart';

class FavoriteTopRow extends StatelessWidget {
  const FavoriteTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          color: Colors.white,
          icon: Container(
            height: size.height * 0.1,
            width: size.width * 0.1,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.01),
        Text(
          "My Favorites",
          style: TextStyle(
            color: darkColor,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
