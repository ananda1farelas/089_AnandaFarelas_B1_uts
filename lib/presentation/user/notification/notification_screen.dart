import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy notifikasi sesuai SRS
    final List<Map<String, String>> notifications = [
      {
        "title": "Update Status Tiket",
        "desc": "Tiket #1204 'Internet Lambat' berubah menjadi In Progress.",
        "time": "2 menit yang lalu",
        "isRead": "false"
      },
      {
        "title": "Tiket Selesai",
        "desc": "Tiket #1198 'Install Office' telah selesai dikerjakan.",
        "time": "1 jam yang lalu",
        "isRead": "true"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Notifikasi")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final isUnread = notifications[index]['isRead'] == "false";
          return Container(
            color: isUnread ? Colors.blue.withValues(alpha: 0.05) : Colors.transparent,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isUnread ? Colors.blue : Colors.grey.shade300,
                child: Icon(
                  isUnread ? Icons.notifications_active : Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
              title: Text(
                notifications[index]['title']!,
                style: TextStyle(fontWeight: isUnread ? FontWeight.bold : FontWeight.normal),
              ),
              subtitle: Text(notifications[index]['desc']!),
              trailing: Text(
                notifications[index]['time']!,
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                // Logika saat notifikasi diklik
              },
            ),
          );
        },
      ),
    );
  }
}