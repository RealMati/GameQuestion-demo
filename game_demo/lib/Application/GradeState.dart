import 'package:game_demo/Domain/entities/Grade.dart';

abstract class GradeState {}

class EmptyGrade extends GradeState {}

class LoadedGrade extends GradeState {
  final List<Grade> grades;

  LoadedGrade(this.grades);
}

class ErrorGrade extends GradeState {
  final String error;

  ErrorGrade(this.error);
}
