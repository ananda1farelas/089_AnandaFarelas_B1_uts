import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim().toLowerCase();
      
      if (username == 'admin') {
        // Navigasi ke Dashboard Admin (FR-008)
        Navigator.pushReplacementNamed(context, '/admin-dashboard');
      } else {
        // Navigasi ke Dashboard User (FR-005)
        Navigator.pushReplacementNamed(context, '/user-dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.confirmation_number, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                const Text(
                  "E-Helpdesk Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("Masuk sesuai akun Anda"),
                const SizedBox(height: 32),
                
                // Input Username (Bisa admin / user)
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username / Email",
                    prefixIcon: Icon(Icons.person),
                    hintText: "Ketik 'admin' untuk Admin",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? "Isi username dulu bang" : null,
                ),
                const SizedBox(height: 16),
                
                // Input Password
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Tombol Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text("LOGIN"),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Link ke Register (FR-003)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/register'),
                      child: const Text("Daftar Sekarang"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}