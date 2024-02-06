import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../utils/styles.dart';
import 'cart_list_product_total.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<CartController>(
      builder: (cartController) {
        if (cartController.myCartList.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.5004,
                width: size.width,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartController.myCartList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                      ),
                      child: const DottedLine(
                        dashLength: 5.0,
                        dashGapLength: 3,
                        lineThickness: 1.5,
                        dashColor: Colors.black26,
                      ),
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final cartFood = cartController.myCartList;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Image Container
                        Container(
                          height: 95,
                          width: 95,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            cartFood[index]['image'],
                          ),
                        ),

                        // Product description with increment and
                        // decrement counter
                        GetBuilder<CartController>(
                          builder: (controller) {
                            return Container(
                              width: size.width * 0.6,
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.010,
                                horizontal: size.width * 0.010,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row with Name and Remove Icon Button
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Name
                                      Text(
                                        cartFood[index]['name'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: darkColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // Remove Icon Button
                                      IconButton(
                                        onPressed: () {
                                          cartController.manageCartProducts(
                                              cartFood[index]);
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Weight
                                  Text(
                                    "560gm",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.010),

                                  // Price and Increase or Decrease of Item Counter
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // $ Sign
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "\$",
                                          style: TextStyle(
                                            color: darkColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      // Pricing Text
                                      Text(
                                        "${cartFood[index]["price"] * cartFood[index]["itemCounter"]}",
                                        style: const TextStyle(
                                          color: darkColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),

                                      // A Container with 2 Icon button of
                                      // increase and decrease of item counter
                                      Container(
                                        height: size.height * 0.042,
                                        width: size.width * 0.23,
                                        decoration: BoxDecoration(
                                          color: yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // Remove Icon
                                            SizedBox(
                                              height: 32,
                                              width: 32,
                                              child: IconButton(
                                                onPressed: () => cartController
                                                    .decrementItem(index),
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),

                                            // Item Counter
                                            Text(
                                              "${cartFood[index]["itemCounter"]}",
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color: darkColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            // Add Icon
                                            SizedBox(
                                              height: 32,
                                              width: 32,
                                              child: IconButton(
                                                onPressed: () => cartController
                                                    .incrementItem(index),
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: size.height * 0.015),

              // Product Calculation
              const CartListProductTotal(),
              SizedBox(height: size.height * 0.015),
              // Checkout Button
              InkWell(
                borderRadius: BorderRadius.circular(45),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Expanded(
            child: Center(
              child: Text(
                "Your Cart is empty",
                style: TextStyle(
                  fontSize: size.height * 0.03,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
