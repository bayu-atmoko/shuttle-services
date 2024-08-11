import 'package:core/core.dart';

class RegisterBody extends Equatable {
  const RegisterBody({
    this.email,
    this.name,
    this.phone,
    this.password,
  });

  final String? email;
  final String? name;
  final String? phone;
  final String? password;

  Map<String, dynamic> toMap() {
    return {
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (password != null) 'password': password,
    };
  }

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        password,
      ];
}
