import 'package:game_demo/Domain/entities/Question.dart';

abstract class QuestionState {}

class EmptyQuestion extends QuestionState {}

class LoadedQuestion extends QuestionState {
  final List<Question> questions;

  LoadedQuestion(this.questions);
}

class ErrorQuestion extends QuestionState {
  final String error;

  ErrorQuestion(this.error);
}
