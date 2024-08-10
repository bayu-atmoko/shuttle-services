import 'dart:convert';

class ExtraUser {
  final int? userId;
  final String? email;
  final String? name;
  final String? role;
  final String? phone;
  final String? address;
  final String? gender;
  final String? vehicle;
  final String? profilePicture;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? village;
  final String? district;
  final String? regency;
  final String? province;

  ExtraUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.phone,
    required this.address,
    required this.gender,
    required this.vehicle,
    required this.profilePicture,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.village,
    required this.district,
    required this.regency,
    required this.province,
  });

  ExtraUser copyWith({
    int? userId,
    String? email,
    String? name,
    String? role,
    String? phone,
    String? address,
    String? gender,
    String? vehicle,
    String? profilePicture,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? village,
    String? district,
    String? regency,
    String? province,
  }) {
    return ExtraUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      vehicle: vehicle ?? this.vehicle,
      profilePicture: profilePicture ?? this.profilePicture,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      village: village ?? this.village,
      district: district ?? this.district,
      regency: regency ?? this.regency,
      province: province ?? this.province,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'role': role,
      'phone': phone,
      'address': address,
      'gender': gender,
      'vehicle': vehicle,
      'profilePicture': profilePicture,
      'deletedAt': deletedAt,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'village': village,
      'district': district,
      'regency': regency,
      'province': province,
    };
  }

  factory ExtraUser.fromMap(Map<String, dynamic> map) {
    return ExtraUser(
      userId: map['userId'] != null ? map['userId'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      deletedAt: map['deletedAt'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      village: map['village'] != null ? map['village'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      regency: map['regency'] != null ? map['regency'] as String : null,
      province: map['province'] != null ? map['province'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtraUser.fromJson(String source) =>
      ExtraUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExtraUser(userId: $userId, email: $email, name: $name, role: $role, phone: $phone, address: $address, gender: $gender, vehicle: $vehicle, profilePicture: $profilePicture, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, village: $village, district: $district, regency: $regency, province: $province)';
  }

  @override
  bool operator ==(covariant ExtraUser other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.role == role &&
        other.phone == phone &&
        other.address == address &&
        other.gender == gender &&
        other.vehicle == vehicle &&
        other.profilePicture == profilePicture &&
        other.deletedAt == deletedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.village == village &&
        other.district == district &&
        other.regency == regency &&
        other.province == province;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        role.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        gender.hashCode ^
        vehicle.hashCode ^
        profilePicture.hashCode ^
        deletedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        village.hashCode ^
        district.hashCode ^
        regency.hashCode ^
        province.hashCode;
  }
}
