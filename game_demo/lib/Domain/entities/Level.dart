class Level {
  final int id;
  final int level;
  final int subject;
  final int passing;
  final int time;
  final String unit;

  Level({
    required this.id,
    required this.level,
    required this.subject,
    required this.passing,
    required this.time,
    required this.unit,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      level: json['level'],
      subject: json['subject'],
      passing: json['passing'],
      time: json['time'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'subject': subject,
      'passing': passing,
      'time': time,
      'unit': unit,
    };
  }
}
