class ChatMessage{
   int? id;
   DateTime? created_at;
  final String content;
  final bool is_bot_text;

  ChatMessage({
    required this.content,
    required this.is_bot_text,
  });
}