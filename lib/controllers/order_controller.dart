import 'package:get/get.dart';

import '../models/food_item_model.dart';

class OrderController extends GetxController{
  final foodItems = [
    FoodItemModel(name: "Beef Burger", price: 500, qty: 1),
    FoodItemModel(name: "Classic Burger", price: 400, qty: 2),
    FoodItemModel(name: "Cheese Chicken Burger", price: 600, qty: 1),
    FoodItemModel(name: "Chicken Legs Basket", price: 800, qty: 1),
    FoodItemModel(name: "French Fries Large", price: 200, qty: 1),
  ].obs;

  Rx<int> subTotal = 0.obs;
  final int deliveryCost = 300;
  RxInt selectedQty=0.obs;

  @override
  void onInit() {
    calculateTotal();
    super.onInit();
  }

  void increaseQty(int index, bool increase){
    if(increase){
      if(selectedQty < 10){
        selectedQty.value++;
      }
    }
    else{
      if(selectedQty > 0){
        selectedQty.value--;
      }
      else{
        selectedQty.value = 1;
      }
    }

    foodItems[index].qty = selectedQty.value;
    calculateTotal();
  }

  void updateQty(int index, int newQty){
    //selectedQty.value = newQty;
    foodItems[index].qty = newQty;
    calculateTotal();
  }

  void removeItem(int index){
    foodItems.removeAt(index);
    calculateTotal();
  }

  void calculateTotal(){
    int totalPrice = 0;

    for(var item in foodItems){
      totalPrice += item.qty * item.price;
    }
    subTotal.value = totalPrice;
  }

  void clearCart(){
    foodItems.clear();
  }
}