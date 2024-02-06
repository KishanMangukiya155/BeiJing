import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../../utils/styles.dart';

class FavoriteProductGridview extends StatelessWidget {
  const FavoriteProductGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return GridView.builder(
          itemCount: controller.favProducts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: size.width * 0.04,
            mainAxisSpacing: size.height * 0.02,
            childAspectRatio: 2.5 / 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            final favorite = controller.favProducts;
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
                        InkWell(
                          onTap: () {
                            controller.manageFavorite(
                              setMeal: favorite[index],
                            );
                          },
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.deepOrange,
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
                      favorite[index]['image'],
                    ),
                  ),

                  // Name
                  Text(
                    favorite[index]['name'],
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
                          favorite[index]['arrivalTime'],
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
                          favorite[index]['ratings'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        favorite[index]['price'].toString(),
                        style: const TextStyle(
                          color: darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
