import 'package:core/core.dart';

class CreateReportBody extends Equatable {
  const CreateReportBody({
    this.description,
    this.complaintId = 8,
    this.district,
    this.village,
    this.address,
    this.latitude,
    this.longitude,
    this.locationName,
    this.garbagePhoto,
  });

  final String? description;
  final int? complaintId;
  final String? district;
  final String? village;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? locationName;
  final List<String>? garbagePhoto;

  Map<String, dynamic> toMap() {
    return {
      if (description != null) 'description': description,
      // if (complaintId != null) 'complaint_id': complaintId,
      'complaint_id': 8,
      if (district != null) 'district': district,
      if (village != null) 'village': village,
      if (address != null) 'address': address,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationName != null) 'location_name': locationName,
      if (garbagePhoto != null) 'garbage_photo': garbagePhoto,
    };
  }

  @override
  List<Object?> get props => [
        description,
        complaintId,
        district,
        village,
        address,
        latitude,
        longitude,
        locationName,
        garbagePhoto,
      ];
}
