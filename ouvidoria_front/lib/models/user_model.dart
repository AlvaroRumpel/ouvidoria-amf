import 'dart:convert';

class UserModel {
  String email;
  bool isAnonymous;

  UserModel({
    required this.email,
    required this.isAnonymous,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'isAnonymous': isAnonymous,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      isAnonymous: map['isAnonymous'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
