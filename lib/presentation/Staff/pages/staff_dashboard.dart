import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/drawer/basic_app_drawer.dart';
import 'package:ticket_system/data/models/ticket.dart';
import 'package:ticket_system/data/repository/ticket_repository.dart';
import 'package:ticket_system/presentation/Staff/widgets/ticket_inf.dart';

class StaffDashboardPage extends StatelessWidget {
  const StaffDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Ticket> tickets = TicketRepository().tickets;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tickets"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
        ],
      ),
      drawer: BasicAppDrawer(), // Thêm menu nếu cần
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Hello!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Text("Tuấn Anh",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return TicketInf(ticket: tickets[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
