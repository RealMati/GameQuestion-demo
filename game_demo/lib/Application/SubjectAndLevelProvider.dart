import 'package:game_demo/Application/SubjectAndLevelNotifier.dart';
import 'package:game_demo/Application/SubjectAndLevelState.dart';
import 'package:game_demo/Domain/GameCollection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameCollectionProvider = Provider<GameCollection>((ref) {
  return GameCollection();
});

final subjectAndLevelProvider =
    StateNotifierProvider<SubjectAndLevelNotifier, SubjectAndLevelState>((ref) {
  final gameCollection = ref.read(gameCollectionProvider);
  return SubjectAndLevelNotifier(gameCollection: gameCollection);
});
