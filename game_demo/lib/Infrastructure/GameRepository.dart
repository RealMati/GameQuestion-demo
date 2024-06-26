import 'package:game_demo/Domain/GameRepositoryImp.dart';
import 'package:game_demo/Domain/entities/Grade.dart';
import 'package:game_demo/Domain/entities/SubjectAndLevel.dart';
import 'package:game_demo/Infrastructure/GameService.dart';

class GameRepository implements GameRepositoryImp {
  final GameService _gameService;
  GameRepository(this._gameService);

  @override
  Future<List<Grade>> getGrades() {
    return _gameService.getGrades();
  }

  @override
  Future<List<SubjectAndLevel>> getSubjectAndLevel() {
    return _gameService.getSubjectAndLevel();
  }
}
