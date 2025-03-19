import 'package:flutter/material.dart';
import 'package:ticket_system/data/models/ticket.dart';
import 'package:ticket_system/presentation/Staff/pages/ticket_detail_staff.dart';

class TicketInf extends StatelessWidget {
  final Ticket ticket;
  const TicketInf({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.support_agent, color: Colors.blue),
        title: Text(ticket.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Người gửi: ${ticket.sender}",
                style: const TextStyle(fontSize: 12)),
            Text("Ngày gửi: ${ticket.date}",
                style: const TextStyle(fontSize: 12)),
            Text("Mức độ ưu tiên: ${ticket.priority}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: getStatusColor(ticket.status).withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            ticket.status,
            style: TextStyle(
                color: getStatusColor(ticket.status),
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => TicketDetailStaff(
                        ticket: ticket,
                      )));
        },
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "NEW":
        return Colors.redAccent;
      case "PROCESSING":
        return Colors.orangeAccent;
      case "COMPLETE":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
