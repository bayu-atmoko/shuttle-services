import 'package:core/core.dart';

class RegisterEntity extends Equatable {
  const RegisterEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataRegister? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataRegister extends Equatable {
  const DataRegister({
    required this.data,
    required this.token,
  });

  final AlphaDataRegister? data;
  final String? token;

  @override
  List<Object?> get props => [
        data,
        token,
      ];
}

class AlphaDataRegister extends Equatable {
  const AlphaDataRegister({
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
    required this.userId,
  });

  final String? email;
  final String? name;
  final String? phone;
  final String? role;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? userId;

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        role,
        updatedAt,
        createdAt,
        userId,
      ];
}
