import 'dart:convert';

class CommentModel {
  String department;
  String subject;
  String message;

  CommentModel({
    required this.department,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'subject': subject,
      'message': message,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      department: map['department'] ?? '',
      subject: map['subject'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));
}
