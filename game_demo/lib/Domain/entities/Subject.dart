class Subject {
  final int id;
  final String name;
  final String grade;
  final String category;
  final String image;
  final int cid;

  Subject({
    required this.id,
    required this.name,
    required this.grade,
    required this.category,
    required this.image,
    required this.cid,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      grade: json['grade'],
      category: json['category'],
      image: json['image'],
      cid: json['cid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'grade': grade,
      'category': category,
      'image': image,
      'cid': cid,
    };
  }
}
