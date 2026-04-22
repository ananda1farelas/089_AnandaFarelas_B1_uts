import 'dart:developer'; // Untuk log pengganti print
import '../../domain/entities/ticket.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../models/dummy_data.dart'; 

class TicketRepositoryImpl implements TicketRepository {
  
  @override
  Future<List<Ticket>> getAllTickets() async {
    // Simulasi delay (Non-Functional Req: Performance/UX)
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Mapping dari Data Map (Dummy) ke Domain Entity
    try {
      return dummyTickets.map((t) => Ticket(
        id: t['id'] ?? '',
        title: t['title'] ?? 'No Title',
        description: t['description'] ?? "Deskripsi dummy dari data layer",
        user: t['user'] ?? 'Unknown',
        status: t['status'] ?? 'Open',
        date: t['date'] ?? '',
      )).toList();
    } catch (e) {
      log("Error mapping tickets: $e");
      return [];
    }
  }

  @override
  Future<void> createTicket(Ticket ticket) async {
    // Simulasi proses simpan data
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Pake log, bukan print (menghilangkan warning avoid_print)
    log("SUCCESS: Tiket '${ticket.title}' berhasil disimpan ke Data Source.");
  }

  @override
  Future<void> updateTicketStatus(String id, String newStatus) async {
    // Simulasi update status
    await Future.delayed(const Duration(milliseconds: 300));
    
    log("UPDATE: Tiket ID $id statusnya kini menjadi $newStatus");
  }
}