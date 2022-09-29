// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Student {
  final String id;
  final String name;
  final String username;
  final String token;
  final String? imageUrl;

  Student({
    required this.id,
    required this.name,
    required this.username,
    required this.token,
    required this.imageUrl,
  });

  NetworkImage? _image;
  NetworkImage? get image {
    final url = imageUrl;
    if (url != null && _image == null) {
      _image = NetworkImage(url);
    }
    return _image;
  }

  Student copyWith({
    String? id,
    String? name,
    String? username,
    String? token,
    String? imageUrl,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      token: token ?? this.token,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'token': token,
      'imageUrl': imageUrl,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      token: map['token'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, name: $name, username: $username, token: $token, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.username == username &&
      other.token == token &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      token.hashCode ^
      imageUrl.hashCode;
  }
}
