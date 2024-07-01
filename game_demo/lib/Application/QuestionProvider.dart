import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/QuestionNotifier.dart';
import 'package:game_demo/Application/QuestionState.dart';
import 'package:game_demo/Domain/GameCollection.dart';

final gameCollectionProvider = Provider<GameCollection>((ref) {
  return GameCollection();
});

final questionProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>((ref) {
  final gameCollection = ref.read(gameCollectionProvider);
  return QuestionNotifier(gameCollection: gameCollection);
});
