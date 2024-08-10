import 'package:dependency_manager/dependency_manager.dart';

class ExtraEditReport extends Equatable {
  final int? reportId;
  final String? status;
  final String? description;
  final int? complaintId;
  final ExtraEditLocation? location;
  final List<ExtraEditMedia>? media;

  const ExtraEditReport({
    required this.reportId,
    required this.status,
    required this.description,
    required this.complaintId,
    required this.location,
    required this.media,
  });

  @override
  List<Object?> get props => [
        reportId,
        status,
        description,
        complaintId,
        media,
      ];
}

class ExtraEditLocation extends Equatable {
  const ExtraEditLocation({
    required this.locationId,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.district,
    required this.village,
  });

  final int? locationId;
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? district;
  final String? village;

  @override
  List<Object?> get props => [
        locationId,
        name,
        address,
        latitude,
        longitude,
        district,
        village,
      ];
}

class ExtraEditMedia extends Equatable {
  const ExtraEditMedia({
    required this.reportMediaId,
    required this.reportId,
    required this.mediaPath,
  });

  final int? reportMediaId;
  final int? reportId;
  final String? mediaPath;

  @override
  List<Object?> get props => [
        reportMediaId,
        reportId,
        mediaPath,
      ];
}
