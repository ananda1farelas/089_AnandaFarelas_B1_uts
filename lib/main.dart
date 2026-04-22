import 'package:flutter/material.dart';

// Import Core (Tema & Konstanta)
import 'core/theme/app_theme.dart';

// Import Presentation Layer (Semua Halaman)
import 'presentation/auth/splash_screen.dart';
import 'presentation/auth/login_screen.dart';
import 'presentation/auth/register_screen.dart';
import 'presentation/admin/dashboard/admin_dashboard_screen.dart';
import 'presentation/user/user_main_nav.dart';
import 'presentation/user/create_tiket/create_ticket_screen.dart';

void main() {
  // Memastikan binding engine Flutter sudah siap
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticketing Helpdesk',
      
      // Mematikan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Konfigurasi Tema sesuai Standar SRS Poin 4.2 & 5
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Otomatis mengikuti Dark/Light mode HP

      // Navigasi Terpusat (Routing System)
      // Dimulai dari Splash Screen sesuai alur profesional
      initialRoute: '/splash',
      
      routes: {
        // --- Auth & Onboarding ---
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        
        // --- Admin / Helpdesk Side (FR-006, FR-008, FR-011) ---
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
        
        // --- User / Pelapor Side (FR-005, FR-007) ---
        '/user-dashboard': (context) => const UserMainNav(),
        '/create-ticket': (context) => const CreateTicketScreen(),
      },

      // Handling jika rute tidak ditemukan (Opsional tapi bagus untuk stabilitas)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      },
    );
  }
}