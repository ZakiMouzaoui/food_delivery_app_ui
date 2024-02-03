import 'package:food_delivery_app_ui/models/notification_model.dart';

final notifications = [
  NotificationModel(content: "Your order has been picked up", isRead: true, date: DateTime.now()),
  NotificationModel(content: "Your order has been delivered", isRead: false, date: DateTime(2023, 10, 29)),
  NotificationModel(content: "Lorem ipsum dolor sit amet, consectetur", isRead: true, date: DateTime(2023, 10, 10)),
  NotificationModel(content: "Lorem ipsum dolor sit amet, consectetur", isRead: false, date: DateTime(2023, 7, 29)),
  NotificationModel(content: "Lorem ipsum dolor sit amet, consectetur", isRead: false, date: DateTime(2023, 7, 29)),
  NotificationModel(content: "Lorem ipsum dolor sit amet, consectetur", isRead: true, date: DateTime(2022, 10, 29)),
];