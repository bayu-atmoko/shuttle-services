part of 'edit_profile_cubit.dart';

class EditProfileStateCubit extends Equatable {
  final GenderEnum? gender;
  final bool? isGenderValid;
  final VehicleEnum? vehicle;
  final bool? isVehicleValid;

  /// image from file picker
  final XFile? photoFile;

  const EditProfileStateCubit({
    this.photoFile,
    this.gender,
    this.isGenderValid,
    this.vehicle,
    this.isVehicleValid,
  });

  @override
  List<Object?> get props => [
        photoFile,
        gender,
        isGenderValid,
        vehicle,
        isVehicleValid,
      ];

  EditProfileStateCubit copyWith({
    XFile? photoFile,
    GenderEnum? gender,
    bool? isGenderValid,
    VehicleEnum? vehicle,
    bool? isVehicleValid,
  }) {
    return EditProfileStateCubit(
      photoFile: photoFile ?? this.photoFile,
      gender: gender ?? this.gender,
      isGenderValid: isGenderValid ?? this.isGenderValid,
      vehicle: vehicle ?? this.vehicle,
      isVehicleValid: isVehicleValid ?? this.isVehicleValid,
    );
  }
}
