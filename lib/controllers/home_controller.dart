import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt setMealCategoryIndex = 0.obs;
  RxInt findCategoryIndex = 0.obs;

  // This list used to display setMeal Products on homePage
  RxList<Map<String, dynamic>> setMeal = [
    {
      "image": "assets/images/set_meal_images/cheese sandwich.png",
      "name": "Cheese Pizza",
      "arrivalTime": "50min",
      "ratings": "4.8",
      "price": 12.99,
      "isFavorite": false,
      "itemCounter": 1,
    },
    {
      "image": "assets/images/set_meal_images/fruit cake.png",
      "name": "Fruit Cake",
      "arrivalTime": "20min",
      "ratings": "4.5",
      "price": 4.88,
      "isFavorite": false,
      "itemCounter": 1,
    },
    {
      "image": "assets/images/set_meal_images/veg salad.png",
      "name": "Veg Salad",
      "arrivalTime": "10min",
      "ratings": "4.7",
      "price": 5.99,
      "isFavorite": false,
      "itemCounter": 1,
    },
    {
      "image": "assets/images/set_meal_images/fruit salad.png",
      "name": "Fruit Salad",
      "arrivalTime": "35min",
      "ratings": "4.5",
      "price": 12.99,
      "isFavorite": false,
      "itemCounter": 1,
    },
  ].obs;

  // This list used in TabBar showed in HomePage
  List<Map<String, dynamic>> findCategory = [
    {
      "value": "Set Meal",
      "widget": Container(),
    },
    {
      "value": "Hot Sale",
      "widget": const Center(
        child: Text("Hot Sale"),
      ),
    },
    {
      "value": "Popularity",
      "widget": const Center(
        child: Text("Popularity"),
      ),
    }
  ];

  // This list used while user adds products as favorite
  List<Map<String, dynamic>> favProducts = [];

  late TabController tabController;

  void setFindCategoryIndex(int value) {
    findCategoryIndex.value = value;
    update();
  }

  void setCategoryIndex(int index) {
    setMealCategoryIndex.value = index;
    update();
  }

  // Function to add or remove favorites from favProducts List
  // and add "isFavorite" on setMeal RxList
  void manageFavorite({required Map<String, dynamic> setMeal}) {
    if (favProducts.contains(setMeal)) {
      favProducts.remove(setMeal);
      setMeal["isFavorite"] = !setMeal["isFavorite"];
      update();
    } else {
      favProducts.add(setMeal);
      setMeal["isFavorite"] = !setMeal["isFavorite"];
      update();
    }
  }
}
