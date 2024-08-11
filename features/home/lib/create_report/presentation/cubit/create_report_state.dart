part of 'create_report_cubit.dart';

class CreateReportStateCubit extends Equatable {
  final DataComplaint? type;
  final String? district;
  final String? village;

  /// Validation
  final bool? isTypeValid;
  final bool? isDistrictValid;
  final bool? isVillageValid;
  final bool? isPhotoValid;

  /// dropdown
  final List<String> districtDropdownList;
  final List<String> villageDropdownList;
  final List<DataComplaint>? complaintList;

  /// image from file picker
  final List<XFile>? photoFile;
  final List<String>? photoUrl;

  /// Maps
  final double? latitude;
  final double? longitude;
  final String? locationName;

  const CreateReportStateCubit({
    this.photoFile,
    this.photoUrl,
    this.type,
    this.district,
    this.village,
    this.isTypeValid = true,
    this.isDistrictValid,
    this.isVillageValid,
    this.isPhotoValid,
    this.districtDropdownList = const [],
    this.villageDropdownList = const [],
    this.complaintList,
    this.latitude,
    this.longitude,
    this.locationName,
  });

  @override
  List<Object?> get props => [
        photoFile,
        photoUrl,
        type,
        district,
        village,
        isTypeValid,
        isDistrictValid,
        isVillageValid,
        isPhotoValid,
        districtDropdownList,
        villageDropdownList,
        complaintList,
        latitude,
        longitude,
        locationName,
      ];

  CreateReportStateCubit copyWith({
    List<XFile>? photoFile,
    List<String>? photoUrl,
    DataComplaint? type,
    String? district,
    String? village,
    bool? isTypeValid,
    bool? isDistrictValid,
    bool? isVillageValid,
    bool? isPhotoValid,
    List<String>? districtDropdownList,
    List<String>? villageDropdownList,
    List<DataComplaint>? complaintList,
    double? latitude,
    double? longitude,
    String? locationName,
  }) {
    return CreateReportStateCubit(
      photoFile: photoFile ?? this.photoFile,
      photoUrl: photoUrl ?? this.photoUrl,
      type: type ?? this.type,
      district: district ?? this.district,
      village: district.isNotNullOrEmpty ? null : (village ?? this.village),
      isTypeValid: isTypeValid ?? this.isTypeValid,
      isDistrictValid: isDistrictValid ?? this.isDistrictValid,
      isVillageValid: isVillageValid ?? this.isVillageValid,
      isPhotoValid: isPhotoValid ?? this.isPhotoValid,
      districtDropdownList: districtDropdownList ?? this.districtDropdownList,
      villageDropdownList: villageDropdownList ?? this.villageDropdownList,
      complaintList: complaintList ?? this.complaintList,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationName: locationName ?? this.locationName,
    );
  }
}
