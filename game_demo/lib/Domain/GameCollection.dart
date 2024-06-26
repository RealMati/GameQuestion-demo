import 'package:game_demo/Domain/entities/Grade.dart';
import 'package:game_demo/Domain/entities/SubjectAndLevel.dart';
import 'package:game_demo/Infrastructure/GameRepository.dart';
import 'package:game_demo/Infrastructure/GameService.dart';

class GameCollection {
  GameCollection();

  Future<List<Grade>> getGrades() async {
    final repo = GameRepository(GameService());
    return repo.getGrades();
  }

  Future<List<SubjectAndLevel>> getSubjectAndLevel() async {
    final repo = GameRepository(GameService());
    return repo.getSubjectAndLevel();
  }
}
