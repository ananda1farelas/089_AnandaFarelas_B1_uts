import 'package:flutter/material.dart';
import '../../../data/models/dummy_data.dart';
import '../../shared_widgets/status_badge.dart';
import '../profile/admin_profile_screen.dart';
import '../detail_tiket/admin_ticket_detail_screen.dart';
import 'admin_ticket_list_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications)
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Statistik Tiket", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatCard("Total", "120", Colors.blue),
                _buildStatCard("Open", "15", Colors.red),
                _buildStatCard("Resolved", "95", Colors.green),
              ],
            ),
            const SizedBox(height: 24),
            const Text("Tiket Terbaru", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyTickets.length,
              itemBuilder: (context, index) {
                final ticket = dummyTickets[index];
                return Card(
                  child: ListTile(
                    title: Text(ticket['title']),
                    subtitle: Text("User: ${ticket['user']} • ${ticket['date']}"),
                    trailing: StatusBadge(status: ticket['status']),
                    onTap: () {
                      // Navigasi ke Detail Tiket sambil ngirim data tiket yang diklik
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              onTap: (index) {
                if (index == 1) { // Index 1 adalah tombol Tiket
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminTicketListScreen()),
                  );
                } else if (index == 2) { // Index 2 adalah tombol Profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminProfileScreen()),
                  );
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: 'Tiket'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          );
        }
        
  Widget _buildStatCard(String label, String count, Color color) {
    return Expanded(
      child: Card(
        color: color.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
              Text(label, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}