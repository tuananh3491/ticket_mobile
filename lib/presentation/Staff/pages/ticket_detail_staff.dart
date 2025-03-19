import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/button/basic_app_button.dart';
import 'package:ticket_system/data/models/comment.dart';
import 'package:ticket_system/data/models/ticket.dart';
import 'package:ticket_system/presentation/Staff/widgets/comment_card.dart';

class TicketDetailStaff extends StatefulWidget {
  final Ticket ticket;

  const TicketDetailStaff({super.key, required this.ticket});

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailStaff> {
  late String _selectedStatus;
  final TextEditingController _replyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.ticket.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết yêu cầu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTicketInfo(),
            const SizedBox(height: 16),
            _buildStatusDropdown(),
            const SizedBox(height: 16),
            Expanded(child: _buildCommentList()),
            _buildReplyButton(),
          ],
        ),
      ),
    );
  }

  // Hiển thị thông tin ticket
  Widget _buildTicketInfo() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(
            color: const Color.fromARGB(255, 194, 193, 193), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow("Người gửi", widget.ticket.sender),
            _buildInfoRow("Tiêu đề", widget.ticket.title),
            _buildInfoRow("Ngày gửi", widget.ticket.date),
            _buildInfoRow("Mức độ ưu tiên", widget.ticket.priority),
            _buildInfoRow("Trạng thái", widget.ticket.status),
          ],
        ),
      ),
    );
  }

  // Dropdown chọn trạng thái
  Widget _buildStatusDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedStatus,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedStatus = newValue;
            widget.ticket.status = newValue;
          });
        }
      },
      items: ["New", "PROCESSING", "COMPLETE"].map((status) {
        return DropdownMenuItem(value: status, child: Text(status));
      }).toList(),
    );
  }

  // Hiển thị danh sách phản hồi
  Widget _buildCommentList() {
    return ListView.builder(
      itemCount: widget.ticket.comments.length,
      itemBuilder: (context, index) {
        return CommentCard(comment: widget.ticket.comments[index]);
      },
    );
  }

  // Nút thêm phản hồi
  Widget _buildReplyButton() {
    return BasicAppButton(
      onPressed: () => _showReplyPopup(),
      title: "Thêm phản hồi",
      height: 50,
    );
  }

  // Popup nhập phản hồi
  void _showReplyPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Thêm phản hồi"),
          content: TextField(
            controller: _replyController,
            decoration: const InputDecoration(hintText: "Nhập phản hồi..."),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Hủy"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_replyController.text.isNotEmpty) {
                  setState(() {
                    widget.ticket.comments.add(Comment(
                      author: "Tuấn Anh",
                      message: _replyController.text,
                      time: "Vừa xong",
                      isSupport: true,
                    ));
                  });
                  _replyController.clear();
                }
                Navigator.pop(context);
              },
              child: const Text("Gửi"),
            ),
          ],
        );
      },
    );
  }

  // Tạo hàng hiển thị thông tin
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
