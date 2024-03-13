import 'package:meta/meta.dart';
import 'dart:convert';

class ProfileEntity {
  final String id;
  final DateTime createdAt;
  final String name;
  final String email;
  final String phone;
  final String city;
  final int tokens;

  ProfileEntity({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.tokens,
  });

  factory ProfileEntity.fromJson(String str) => ProfileEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileEntity.fromMap(Map<String, dynamic> json) => ProfileEntity(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    city: json["city"],
    tokens: json["tokens"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "email": email,
    "phone": phone,
    "city": city,
    "tokens": tokens,
  };

  ProfileEntity copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
    String? email,
    String? phone,
    String? city,
    int? tokens,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      tokens: tokens ?? this.tokens,
    );
  }
}
