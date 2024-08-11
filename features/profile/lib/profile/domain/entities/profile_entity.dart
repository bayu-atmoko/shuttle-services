import 'package:core/core.dart';

class ProfileEntity extends Equatable {
  const ProfileEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataProfile? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataProfile extends Equatable {
  const DataProfile({
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

  @override
  List<Object?> get props => [
        userId,
        email,
        name,
        role,
        phone,
        address,
        gender,
        vehicle,
        profilePicture,
        deletedAt,
        createdAt,
        updatedAt,
        village,
        district,
        regency,
        province,
      ];
}
