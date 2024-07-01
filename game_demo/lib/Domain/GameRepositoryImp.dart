import 'package:game_demo/Domain/entities/Grade.dart';
import 'package:game_demo/Domain/entities/Question.dart';
import 'package:game_demo/Domain/entities/SubjectAndLevel.dart';

abstract class GameRepositoryImp {
  Future<List<Grade>> getGrades();
  Future<List<SubjectAndLevel>> getSubjectAndLevel();
  Future<List<Question>> getQuestion();
}
