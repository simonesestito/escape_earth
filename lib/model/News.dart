import 'package:meta/meta.dart';

@immutable
class News {
  final String title;
  final String preview;
  final String imageUrl;
  final String text;
  final DateTime date;

  News({
    @required this.title,
    @required this.preview,
    @required this.imageUrl,
    @required this.text,
    @required this.date,
  });
}