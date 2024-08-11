import 'package:core/core.dart';

class EditReportBody extends Equatable {
  const EditReportBody({
    required this.reportId,
    this.description,
    this.complaintId = 8,
    this.district,
    this.village,
    this.address,
    this.latitude,
    this.longitude,
    this.locationName,
    this.cancellationReason,
    this.status,
    this.officerId,
    this.garbagePhoto,
    this.garbagePhotoCleaned,
  });

  final String reportId;
  final String? description;
  final int? complaintId;
  final String? district;
  final String? village;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? locationName;
  final String? cancellationReason;
  final String? status;
  final int? officerId;
  final List<String>? garbagePhoto;
  final List<String>? garbagePhotoCleaned;

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
      if (cancellationReason != null) 'cancellation_reason': cancellationReason,
      if (status != null) 'status': status,
      if (officerId != null) 'officer_id': officerId,
      if (garbagePhoto != null) 'garbage_photo': garbagePhoto,
      if (garbagePhotoCleaned != null)
        'garbage_photo_cleaned': garbagePhotoCleaned,
    };
  }

  @override
  List<Object?> get props => [
        reportId,
        description,
        complaintId,
        district,
        village,
        address,
        latitude,
        longitude,
        locationName,
        cancellationReason,
        status,
        officerId,
        garbagePhoto,
        garbagePhotoCleaned,
      ];
}
