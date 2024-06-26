import 'package:game_demo/Domain/entities/SubjectAndLevel.dart';

abstract class SubjectAndLevelState {}

class EmptySubjectAndLevel extends SubjectAndLevelState {}

class LoadedSubjectAndLevel extends SubjectAndLevelState {
  final List<SubjectAndLevel> subjectAndLevels;

  LoadedSubjectAndLevel(this.subjectAndLevels);
}

class ErrorSubjectAndLevel extends SubjectAndLevelState {
  final String error;

  ErrorSubjectAndLevel(this.error);
}
