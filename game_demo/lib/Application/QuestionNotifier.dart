import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/QuestionState.dart';
import 'package:game_demo/Domain/GameCollection.dart';

class QuestionNotifier extends StateNotifier<QuestionState> {
  final GameCollection gameCollection;

  QuestionNotifier({required this.gameCollection}) : super(EmptyQuestion());

  Future<void> fetchQuestion() async {
    try {
      final question = await gameCollection.getQuestion();
      if (question.isEmpty) {
        state = EmptyQuestion();
      } else {
        state = LoadedQuestion(question);
      }
    } catch (e) {
      state = ErrorQuestion(e.toString());
    }
  }
}
