import 'package:get/get.dart';

import '../models/inbox_model.dart';

class InboxController extends GetxController{
  final messages = [
    InboxModel(id:"1", object: "Monkey Meal Promotions", content: "Lorem ipsum dolor sit amet, consectetur", isRead: false, date: DateTime(2023, 12, 25)),
    InboxModel(id:"2",object: "Order #123456 Confirmed", content: "Your order has been confirmed and is being prepared. Estimated delivery time is 30 minutes.", isRead: true, date: DateTime(2023, 11, 19)),
    InboxModel(id:"3",object: "Your Food is on the Way!", content: " Your order is out for delivery. Our delivery partner, John, is on the way to your location. Track your order in real-time.", isRead: true, date: DateTime(2023, 7, 5)),
    InboxModel(id:"4",object: "Monkey Meal Promotions", content: "Lorem ipsum dolor sit amet, consectetur", isRead: false, date: DateTime(2022, 8, 28)),
    InboxModel(id:"5",object: "Monkey Meal Promotions", content: "Lorem ipsum dolor sit amet, consectetur", isRead: true, date: DateTime(2022, 6, 2)),
  ].obs;

  final RxList<String> favorites = ["1"].obs;
  final RxSet<String> viewedMessages = {"2", "3", "5"}.obs;

  void markAsRead(String id){
    viewedMessages.add(id);
  }

  void removeMessage(InboxModel message){
    messages.remove(message);
  }

  void toggleFavorites(String id){
    if(favorites.contains(id)){
      favorites.remove(id);
    }
    else{
      favorites.add(id);
    }
  }
}