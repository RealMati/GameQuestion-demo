import 'package:game_demo/Domain/entities/Subject.dart';
import 'package:game_demo/Domain/entities/Level.dart';

class SubjectAndLevel {
  final Subject subject;
  final List<Level> levels;

  SubjectAndLevel({
    required this.subject,
    required this.levels,
  });

  factory SubjectAndLevel.fromJson(Map<String, dynamic> json) {
    return SubjectAndLevel(
      subject: Subject.fromJson(json['subject']),
      levels: List<Level>.from(
          json['levels'].map((levelJson) => Level.fromJson(levelJson))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject.toJson(),
      'levels': levels.map((level) => level.toJson()).toList(),
    };
  }
}
