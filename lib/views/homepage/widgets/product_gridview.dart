import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/home_controller.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (controller) {
        return GridView.builder(
          itemCount: controller.setMeal.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: size.width * 0.04,
            mainAxisSpacing: size.height * 0.02,
            childAspectRatio: 2.5 / 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            final setMeal = controller.setMeal;
            return Container(
              height: size.height * 0.255,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black54),
              ),
              child: Column(
                children: [
                  // Favourite Icon
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.015,
                      right: size.width * 0.030,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller.manageFavorite(
                                setMeal: setMeal[index],
                              );
                            },
                            child: Icon(
                              setMeal[index]["isFavorite"]
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: setMeal[index]["isFavorite"]
                                  ? Colors.deepOrange
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Image
                  Container(
                    height: size.height * 0.150,
                    width: size.width * 0.350,
                    margin: EdgeInsets.only(bottom: size.height * 0.022),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      setMeal[index]['image'],
                    ),
                  ),

                  // Name
                  Text(
                    setMeal[index]['name'],
                    style: TextStyle(
                      fontSize: size.height * 0.023,
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Arrival time and ratings
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          setMeal[index]['arrivalTime'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: size.width * 0.0115),
                        Icon(
                          Icons.circle,
                          size: size.height * 0.01,
                          color: Colors.grey,
                        ),
                        SizedBox(width: size.width * 0.0115),
                        Icon(
                          Icons.star,
                          size: size.height * 0.015,
                          color: yellowColor,
                        ),
                        Text(
                          setMeal[index]['ratings'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Price and "Add to Cart" Button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.12),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "\$",
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        setMeal[index]['price'].toString(),
                        style: const TextStyle(
                          color: darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),

                      // Add to cart Button
                      GetBuilder<CartController>(
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {
                              controller.manageCartProducts(setMeal[index]);
                            },
                            child: Container(
                              height: size.height * 0.0458,
                              width: size.width * 0.090,
                              decoration: BoxDecoration(
                                color: controller
                                        .checkProductInCart(setMeal[index])
                                    ? yellowColor
                                    : Colors.black87,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.cartPlus,
                                  size: size.height * 0.022,
                                  color: controller
                                          .checkProductInCart(setMeal[index])
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
