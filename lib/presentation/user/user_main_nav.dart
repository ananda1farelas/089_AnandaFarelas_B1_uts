import 'package:flutter/material.dart';
import 'list_tiket/user_ticket_list_screen.dart';
import 'profile/profile_screen.dart'; // Import file profil lu

class UserMainNav extends StatefulWidget {
  const UserMainNav({super.key});

  @override
  State<UserMainNav> createState() => _UserMainNavState();
}

class _UserMainNavState extends State<UserMainNav> {
  int _currentIndex = 0;
  
  // List halaman yang dipanggil oleh Bottom Nav
  final _pages = [
    const UserTicketListScreen(), 
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: 'Tiket'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}