import 'flashcard_set.dart';

class FlashCardSet {
  final String id;
  final String name;
  final String description;
  final List<FlashCardItem> items;

  FlashCardSet(
      {required this.id,
      required this.name,
      required this.description,
      required this.items});
}
