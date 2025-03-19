import 'package:ticket_system/data/models/comment.dart';

class Ticket {
  final String id;
  final String sender;
  final String title;
  final String date;
  String status; // Trạng thái ticket
  final String description;
  final String category;
  final String priority;
  final String department;
  final String? imagePath;
  final List<Comment> comments;

  Ticket({
    required this.id,
    required this.sender,
    required this.title,
    required this.date,
    required this.status,
    required this.description,
    required this.category,
    required this.priority,
    required this.department,
    this.imagePath,
    required this.comments,
  });
}
