import 'package:get/get.dart';
import 'widgets/favorite_toprow.dart';
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';
import 'package:beijing/views/favoritepage/widgets/favorite_product_gridview.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.060,
          right: size.width * 0.060,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),

              // A TopRow Widget
              const FavoriteTopRow(),

              // const ProductGridView()

              homeController.favProducts.isNotEmpty
                  ? const FavoriteProductGridview()
                  : Center(
                      child: Text(
                        "No Favorites Found",
                        style: TextStyle(
                          fontSize: size.height * 0.020,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
