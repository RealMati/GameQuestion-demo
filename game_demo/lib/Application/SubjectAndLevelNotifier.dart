import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/SubjectAndLevelState.dart';

import 'package:game_demo/Domain/GameCollection.dart';

class SubjectAndLevelNotifier extends StateNotifier<SubjectAndLevelState> {
  final GameCollection gameCollection;

  SubjectAndLevelNotifier({required this.gameCollection})
      : super(EmptySubjectAndLevel());

  Future<void> fetchSubjectAndSubjectAndLevel() async {
    try {
      final subjectAndSubjectAndLevel =
          await gameCollection.getSubjectAndLevel();
      if (subjectAndSubjectAndLevel.isEmpty) {
        state = EmptySubjectAndLevel();
      } else {
        state = LoadedSubjectAndLevel(subjectAndSubjectAndLevel);
      }
    } catch (e) {
      state = ErrorSubjectAndLevel(e.toString());
    }
  }
}
