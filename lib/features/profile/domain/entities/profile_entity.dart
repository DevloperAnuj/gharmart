
class ProfileEntity {

  final String name;
  final String email;
  final String phone;
  final String city;
  final String id;

  const ProfileEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.id,
  });

  ProfileEntity copyWith({
    String? name,
    String? email,
    String? phone,
    String? city,
    String? id,
  }) {
    return ProfileEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
    };
  }

  factory ProfileEntity.fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
      id: map['id'] as String,
    );
  }
}