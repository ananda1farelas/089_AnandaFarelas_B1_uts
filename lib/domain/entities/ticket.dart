class Ticket {
  final String id;
  final String title;
  final String description;
  final String user;
  final String status;
  final String date;
  final String? imageUrl;

  Ticket({
    required this.id,
    required this.title,
    required this.description,
    required this.user,
    required this.status,
    required this.date,
    this.imageUrl,
  });
}