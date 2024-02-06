import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:beijing/controllers/cart_controller.dart';
import 'package:beijing/views/cartpage/widgets/cart_list.dart';
import 'package:beijing/views/cartpage/widgets/cartPage_topRow.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.030,
          left: size.width * 0.060,
          right: size.width * 0.060,
          bottom: size.height * 0.030,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // A top row with center heading and IconButtons of each side
            CartPageTopRow(),

            // A "CartList" Widget with myCartList calculations and
            // "Checkout" button
            CartList(),
          ],
        ),
      ),
    );
  }
}
