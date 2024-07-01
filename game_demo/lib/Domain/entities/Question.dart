class Question {
  final int id;
  final String question;
  final int subjectId;
  final String passage;
  final String answer;
  final String explanation;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;

  Question({
    required this.id,
    required this.question,
    required this.subjectId,
    required this.passage,
    required this.answer,
    required this.explanation,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      subjectId: json['subjectId'],
      passage: json['passage'],
      answer: json['answer'],
      explanation: json['explanation'],
      optionA: json['A'],
      optionB: json['B'],
      optionC: json['C'],
      optionD: json['D'],
    );
  }
}
