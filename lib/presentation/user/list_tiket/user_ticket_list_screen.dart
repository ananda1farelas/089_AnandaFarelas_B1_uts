import 'package:flutter/material.dart';
import '../../../data/models/dummy_data.dart';
import '../../shared_widgets/status_badge.dart';

class UserTicketListScreen extends StatelessWidget {
  const UserTicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tiket Saya")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyTickets.length,
        itemBuilder: (context, index) {
          final ticket = dummyTickets[index];
          return Card(
            child: ListTile(
              title: Text(ticket['title']),
              subtitle: Text("ID: ${ticket['id']} • ${ticket['date']}"),
              trailing: StatusBadge(status: ticket['status']),
              onTap: () {
                // Navigasi ke detail tiket versi user (FR-005 point 4)
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create-ticket'),
        child: const Icon(Icons.add),
      ),
    );
  }
}