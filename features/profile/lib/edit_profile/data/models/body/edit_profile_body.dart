import 'package:core/core.dart';

class EditProfileBody extends Equatable {
  const EditProfileBody({
    this.name,
    this.role,
    this.password,
    this.address,
    this.village,
    this.district,
    this.regency,
    this.province,
    this.gender,
    this.vehicle,
    this.profilePicture,
    this.phone,
  });

  final String? name;
  final String? role;
  final String? password;
  final String? address;
  final String? village;
  final String? district;
  final String? regency;
  final String? province;
  final String? gender;
  final String? vehicle;
  final String? profilePicture;
  final String? phone;

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (password != null) 'password': password,
      if (address != null) 'address': address,
      if (village != null) 'village': village,
      if (district != null) 'district': district,
      if (regency != null) 'regency': regency,
      if (province != null) 'province': province,
      if (gender != null) 'gender': gender,
      if (vehicle != null) 'vehicle': vehicle,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (phone != null) 'phone': phone,
    };
  }

  @override
  List<Object?> get props => [
        name,
        role,
        password,
        address,
        village,
        district,
        regency,
        province,
        gender,
        vehicle,
        profilePicture,
        phone,
      ];
}
