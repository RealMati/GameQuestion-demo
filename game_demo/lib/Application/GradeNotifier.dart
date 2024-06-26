import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/GradeState.dart';
import 'package:game_demo/Domain/GameCollection.dart';

class GradeNotifier extends StateNotifier<GradeState> {
  final GameCollection gameCollection;

  GradeNotifier({required this.gameCollection}) : super(EmptyGrade());

  Future<void> fetchGrades() async {
    try {
      final grades = await gameCollection.getGrades();
      if (grades.isEmpty) {
        state = EmptyGrade();
      } else {
        state = LoadedGrade(grades);
      }
    } catch (e) {
      state = ErrorGrade(e.toString());
    }
  }
}
