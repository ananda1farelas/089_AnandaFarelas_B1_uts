import 'package:flutter/material.dart';
import '../../../data/models/dummy_data.dart';
import '../../shared_widgets/status_badge.dart';
import '../notification/notification_screen.dart';

class UserTicketListScreen extends StatelessWidget {
  const UserTicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiket Saya"),
        // --- TAMBAHAN ACTION NOTIFIKASI DISINI ---
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none_outlined),
                // Titik merah indikator notifikasi baru
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        // ------------------------------------------
      ),
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
        backgroundColor: Theme.of(context).primaryColor, // Biar warnanya konsisten
        child: const Icon(Icons.add),
      ),
    );
  }
}