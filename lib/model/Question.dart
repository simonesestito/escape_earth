import 'package:meta/meta.dart';

@immutable
class Question {
  final String question;
  final String answer;

  Question({
    this.answer,
    this.question,
  });
}