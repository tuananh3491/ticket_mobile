import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/drawer/basic_app_drawer.dart';
import 'package:ticket_system/core/configs/theme/app_color.dart';
import 'package:ticket_system/data/models/ticket.dart';
import 'package:ticket_system/data/repository/ticket_repository.dart';
import 'package:ticket_system/presentation/user/pages/create_ticket.dart';
import '../widgets/ticket_card.dart';

class HomePage extends StatelessWidget {
  final TicketRepository ticketRepository = TicketRepository();

  @override
  Widget build(BuildContext context) {
    List<Ticket> tickets = ticketRepository.tickets;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Tickets",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      drawer: BasicAppDrawer(),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF8FAFB)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Hello!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    Text("Nhân Tâm",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My request",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, size: 18),
                    label: Text("Filter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Màu nền
                      foregroundColor: Colors.black,
                      iconColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Padding
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: Color(0xffEAEEF4), width: 2) // Bo góc tròn
                          ),
                      elevation: 0, // Không có bóng
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: tickets.length,
                  itemBuilder: (context, index) {
                    return TicketCard(ticket: tickets[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => CreateTicketPage()));
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          "Create Request",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
