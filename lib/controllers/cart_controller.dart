import 'package:get/get.dart';

class CartController extends GetxController {
  RxDouble itemTotal = 0.0.obs;
  RxDouble deliveryCharge = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble total = 0.0.obs;

  List<Map<String, dynamic>> myCartList = [];

  void incrementItem(int index) {
    myCartList[index]['itemCounter']++;
    itemTotal.value += myCartList[index]["price"];
    deliveryCharge.value += 1.0;
    tax.value += 0.5;
    total.value = itemTotal.value + deliveryCharge.value + tax.value;
    update();
  }

  void decrementItem(int index) {
    if (myCartList[index]['itemCounter'] > 1) {
      myCartList[index]['itemCounter']--;
      itemTotal.value -= myCartList[index]["price"];
      deliveryCharge.value -= 1.0;
      tax.value -= 0.5;
      total.value = itemTotal.value + deliveryCharge.value + tax.value;
    }
    update();
  }

  // Function to add or remove products from myCartList
  // and perform calculations
  void manageCartProducts(Map<String, dynamic> cartProduct) {
    if (myCartList.contains(cartProduct)) {
      myCartList.remove(cartProduct);

      // Calculation with charges while removing product
      itemTotal.value -= cartProduct["price"];
      deliveryCharge.value -= 1.0;
      tax.value -= 0.5;
      total.value = itemTotal.value + deliveryCharge.value + tax.value;
      update();
    } else {
      myCartList.add(cartProduct);

      // Calculation with charges while adding product
      itemTotal.value += cartProduct["price"];
      deliveryCharge.value += 1.0;
      tax.value += 0.5;
      total.value = itemTotal.value + deliveryCharge.value + tax.value;
      update();
    }
  }

  bool checkProductInCart(Map<String, dynamic> cartProduct) {
    return myCartList.contains(cartProduct);
  }
}
