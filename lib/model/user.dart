// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class User {
  final int id;
  final String username;
  final String email;
  final String password;

  //contructor, conversi dari atau ke json

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, password: $password)';
  }
}
