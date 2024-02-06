import 'package:beijing/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/styles.dart';

class CartListProductTotal extends StatelessWidget {
  const CartListProductTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartController = Get.find<CartController>();
    return Column(
      children: [
        // Item Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Item Total:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
            Obx(() {
              return Text(
                cartController.itemTotal.value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              );
            }),
          ],
        ),

        SizedBox(height: size.height * 0.008),

        // Delivery charge
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Delivery Charge:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
            Obx(() {
              return Text(
                cartController.deliveryCharge.value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              );
            })
          ],
        ),

        SizedBox(height: size.height * 0.008),

        // Tax Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tax:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
            ),
            Obx(() {
              return Text(
                cartController.tax.value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              );
            })
          ],
        ),

        SizedBox(height: size.height * 0.025),

        // Total Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total:",
              style: TextStyle(
                fontSize: 25,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() {
              return Text(
                cartController.total.value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 25,
                  color: darkColor,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
