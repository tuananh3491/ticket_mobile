class Comment {
  final String author;
  final String message;
  final String time;
  final bool isSupport;

  Comment({
    required this.author,
    required this.message,
    required this.time,
    this.isSupport = false,
  });
}
