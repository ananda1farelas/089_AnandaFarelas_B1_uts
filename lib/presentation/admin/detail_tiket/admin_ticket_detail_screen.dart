import 'package:flutter/material.dart';
import '../../shared_widgets/status_badge.dart';

class AdminTicketDetailScreen extends StatelessWidget {
  final Map<String, dynamic> ticket;

  const AdminTicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Tiket")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ticket ID: #${ticket['id'] ?? 'N/A'}", 
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                StatusBadge(status: ticket['status']),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Judul Masalah:", style: TextStyle(color: Colors.grey)),
            Text(ticket['title'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 32),
            const Text("Pelapor:", style: TextStyle(color: Colors.grey)),
            Text(ticket['user'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text("Tanggal Lapor:", style: TextStyle(color: Colors.grey)),
            Text(ticket['date'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text("Deskripsi:", style: TextStyle(color: Colors.grey)),
            const Text(
              "Ini adalah contoh deskripsi masalah yang dilaporkan oleh user. Biasanya berisi keluhan terkait sistem informasi atau kendala teknis lainnya.",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            
            // Tombol Aksi Admin (Update Status)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika update status di sini nanti
                },
                child: const Text("Update Status Tiket"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}