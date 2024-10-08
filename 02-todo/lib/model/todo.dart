// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Todo {
  final String name;
  final DateTime createdAt;

  const Todo({
    required this.name,
    required this.createdAt,
  });

  Todo copyWith({
    String? name,
    DateTime? createdAt,
  }) {
    return Todo(
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name'] as String,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.name == name && other.createdAt == createdAt;
  }

  @override
  int get hashCode => name.hashCode ^ createdAt.hashCode;
}
