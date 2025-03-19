import 'package:flutter/material.dart';
import 'package:ticket_system/data/models/ticket.dart';
import 'package:ticket_system/presentation/user/pages/ticket_detail_page.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(0xffEAEEF4), width: 1),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title:
            Text(ticket.title, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(ticket.date),
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
                  builder: (ctx) => TicketDetailsPage(
                        supportTicket: ticket,
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
