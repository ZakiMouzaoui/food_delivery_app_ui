class InboxModel{
  const InboxModel({required this.id, required this.object, required this.content, required this.isRead, required this.date});

  final String id;
  final String object;
  final String content;
  final bool isRead;
  final DateTime date;
}