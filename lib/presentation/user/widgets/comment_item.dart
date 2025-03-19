import 'package:flutter/material.dart';
import 'package:ticket_system/data/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: comment.isSupport ? Colors.lightGreen[100] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.author, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(comment.message),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(comment.time, style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
