import 'package:game_demo/Application/GradeNotifier.dart';
import 'package:game_demo/Application/GradeState.dart';
import 'package:game_demo/Domain/GameCollection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameCollectionProvider = Provider<GameCollection>((ref) {
  return GameCollection();
});

final gradeProvider = StateNotifierProvider<GradeNotifier, GradeState>((ref) {
  final gameCollection = ref.read(gameCollectionProvider);
  return GradeNotifier(gameCollection: gameCollection);
});
