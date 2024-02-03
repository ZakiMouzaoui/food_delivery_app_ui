class NotificationModel{
  const NotificationModel({required this.content, required this.isRead, required this.date});

  final String content;
  final bool isRead;
  final DateTime date;
}