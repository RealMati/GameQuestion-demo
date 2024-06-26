class Grade {
  final String name;
  final String description;
  final String curriculumGrade;

  Grade({
    required this.name,
    required this.description,
    required this.curriculumGrade,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      name: json['name'],
      description: json['description'],
      curriculumGrade: json['curriculum_grade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'curriculum_grade': curriculumGrade,
    };
  }
}
