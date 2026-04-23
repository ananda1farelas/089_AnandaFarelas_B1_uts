import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Pindah ke Login setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.confirmation_number, size: 100, color: Colors.blue),
            SizedBox(height: 16),
            Text("E-Ticketing Helpdesk", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Teknik Informatika UNAIR"),
          ],
        ),
      ),
    );
  }
}