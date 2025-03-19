import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/button/basic_app_button.dart';
import 'package:ticket_system/data/models/comment.dart';
import 'package:ticket_system/data/models/ticket.dart';
import '../widgets/comment_item.dart';

class TicketDetailsPage extends StatefulWidget {
  final Ticket supportTicket;

  const TicketDetailsPage({Key? key, required this.supportTicket})
      : super(key: key);

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    comments = widget.supportTicket.comments;
  }

  void addComment(String message) {
    setState(() {
      comments.add(
        Comment(author: "Nhân Tâm", message: message, time: "20:30"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Người gửi: ${widget.supportTicket.sender}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Tiêu đề: ${widget.supportTicket.title}"),
            Text("Ngày gửi: ${widget.supportTicket.date}"),
            Text("Ticket ID: ${widget.supportTicket.id}"),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return CommentItem(comment: comments[index]);
                },
              ),
            ),
            SizedBox(height: 10),
            BasicAppButton(
              onPressed: () => _showAddCommentDialog(),
              title: "Add Feedback",
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCommentDialog() {
    TextEditingController _commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Thêm Phản Hồi"),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(hintText: "Nhập phản hồi..."),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  setState(() {
                    comments.add(
                      Comment(
                        author: "Nhân Tâm", // Giả định user hiện tại
                        message: _commentController.text,
                        time: "${DateTime.now().hour}:${DateTime.now().minute}",
                      ),
                    );
                  });
                  Navigator.pop(context); // Đóng popup
                }
              },
              child: Text(
                "Gửi",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
