import 'package:flutter/material.dart';
import 'package:ticket_system/data/models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: comment.isSupport ? Colors.blue[50] : Colors.white,
      child: ListTile(
        title: Text(comment.author,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: comment.isSupport ? Colors.blue : Colors.black)),
        subtitle: Text(comment.message),
        trailing: Text(comment.time,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}