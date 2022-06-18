import 'dart:convert';

class CommentModel {
  String? id;
  String department;
  String subject;
  String message;
  String email;
  String response;
  bool isAnonymous;

  CommentModel({
    this.id,
    required this.department,
    required this.subject,
    required this.message,
    required this.email,
    required this.response,
    required this.isAnonymous,
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
      id: map['id'],
      department: map['setor'] ?? '',
      subject: map['assunto'] ?? '',
      message: map['texto'] ?? '',
      email: map['email'],
      response: map['resposta'],
      isAnonymous: map['anonimo'] == 'False' ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source));
}
