import 'package:beijing/views/favoritepage/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/styles.dart';
import '../../cartpage/add_to_cart_page.dart';
import '../../settingspage/settings_page.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icon
        Icon(
          Icons.location_on,
          size: size.height * 0.050,
          color: yellowColor,
        ),

        // "BeiJing" text
        Text(
          "BeiJing",
          style: TextStyle(
            color: darkColor,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),

        // Favorite Button
        IconButton(
          onPressed: () {
            Get.to(FavoritePage());
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
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ),

        // Cart Button
        IconButton(
          onPressed: () {
            Get.to(const CartPage());
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
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),

        // Settings Button
        IconButton(
          onPressed: () {
            Get.to(const SettingsPage());
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
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
