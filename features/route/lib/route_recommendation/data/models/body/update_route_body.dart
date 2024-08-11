import 'package:core/core.dart';

class UpdateRouteBody extends Equatable {
  const UpdateRouteBody({
    required this.routeId,
    this.totalDistance,
    this.totalDuration,
    this.origin,
    this.destination,
    this.step,
  });

  final String routeId;
  final int? totalDistance;
  final int? totalDuration;
  final OriginUpdateRoute? origin;
  final DestinationUpdateRoute? destination;
  final List<StepUpdateRoute>? step;

  Map<String, dynamic> toMap() {
    return {
      if (totalDistance != null) 'total_distance': totalDistance,
      if (totalDuration != null) 'total_duration': totalDuration,
      if (origin != null) 'origin': origin?.toMap(),
      if (destination != null) 'destination': destination?.toMap(),
      if (step != null) 'step': step?.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        routeId,
        totalDistance,
        totalDuration,
        origin,
        destination,
        step,
      ];
}

class OriginUpdateRoute extends Equatable {
  const OriginUpdateRoute({
    this.name,
    this.address,
    this.district,
    this.village,
    this.latitude,
    this.longitude,
  });

  final String? name;
  final String? address;
  final String? district;
  final String? village;
  final int? latitude;
  final int? longitude;

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (district != null) 'district': district,
      if (village != null) 'village': village,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
        name,
        address,
        district,
        village,
        latitude,
        longitude,
      ];
}

class DestinationUpdateRoute extends Equatable {
  const DestinationUpdateRoute({
    this.name,
    this.address,
    this.district,
    this.village,
    this.latitude,
    this.longitude,
  });

  final String? name;
  final String? address;
  final String? district;
  final String? village;
  final int? latitude;
  final int? longitude;

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (district != null) 'district': district,
      if (village != null) 'village': village,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
        name,
        address,
        district,
        village,
        latitude,
        longitude,
      ];
}

class StepUpdateRoute extends Equatable {
  const StepUpdateRoute({
    this.stepNumber,
    this.distance,
    this.duration,
    this.name,
    this.address,
    this.district,
    this.village,
    this.latitude,
    this.longitude,
  });

  final int? stepNumber;
  final int? distance;
  final int? duration;
  final String? name;
  final String? address;
  final String? district;
  final String? village;
  final int? latitude;
  final int? longitude;

  Map<String, dynamic> toMap() {
    return {
      if (stepNumber != null) 'step_number': stepNumber,
      if (distance != null) 'distance': distance,
      if (duration != null) 'duration': duration,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (district != null) 'district': district,
      if (village != null) 'village': village,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [
        stepNumber,
        distance,
        duration,
        name,
        address,
        district,
        village,
        latitude,
        longitude,
      ];
}
