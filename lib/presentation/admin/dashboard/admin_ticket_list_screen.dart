import 'package:flutter/material.dart';
import '../../../data/models/dummy_data.dart';
import '../../shared_widgets/status_badge.dart';
import '../detail_tiket/admin_ticket_detail_screen.dart';

class AdminTicketListScreen extends StatelessWidget {
  const AdminTicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Semua Tiket")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyTickets.length,
        itemBuilder: (context, index) {
          final ticket = dummyTickets[index];
          return Card(
            child: ListTile(
              title: Text(ticket['title']),
              subtitle: Text("User: ${ticket['user']} • ${ticket['date']}"),
              trailing: StatusBadge(status: ticket['status']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminTicketDetailScreen(ticket: ticket),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}