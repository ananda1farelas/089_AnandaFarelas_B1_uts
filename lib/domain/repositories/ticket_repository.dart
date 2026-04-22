import '../entities/ticket.dart';

abstract class TicketRepository {
  // Janji bisa ambil daftar tiket
  Future<List<Ticket>> getAllTickets();
  
  // Janji bisa bikin tiket baru
  Future<void> createTicket(Ticket ticket);
  
  // Janji bisa update status (buat Admin)
  Future<void> updateTicketStatus(String id, String newStatus);
}