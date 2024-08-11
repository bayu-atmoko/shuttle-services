part of 'map_cubit.dart';

class MapStateCubit extends Equatable {
  const MapStateCubit({
    required this.polyLineCoordinates,
    this.currentLocation,
    required this.zoom,
    this.currentCameraPosition,
    this.reportAssigned,
    this.reportCleaned,
    this.markerReportLatLng,
    this.routeId,
  });

  /// maps
  final List<LatLng> polyLineCoordinates;
  final LocationData? currentLocation;
  final double zoom;
  final CameraPosition? currentCameraPosition;

  /// report
  final List<AlphaDataListReport>? reportAssigned;
  final List<AlphaDataListReport>? reportCleaned;
  final List<LatLng>? markerReportLatLng;

  // route
  final int? routeId;

  MapStateCubit copyWith({
    List<LatLng>? polyLineCoordinates,
    LocationData? currentLocation,
    double? zoom,
    CameraPosition? currentCameraPosition,
    List<AlphaDataListReport>? reportAssigned,
    List<AlphaDataListReport>? reportCleaned,
    List<LatLng>? markerReportLatLng,
    int? routeId,
  }) {
    return MapStateCubit(
      polyLineCoordinates: polyLineCoordinates ?? this.polyLineCoordinates,
      currentLocation: currentLocation ?? this.currentLocation,
      zoom: zoom ?? this.zoom,
      currentCameraPosition:
          currentCameraPosition ?? this.currentCameraPosition,
      reportAssigned: reportAssigned ?? this.reportAssigned,
      reportCleaned: reportCleaned ?? this.reportCleaned,
      markerReportLatLng: markerReportLatLng ?? this.markerReportLatLng,
      routeId: routeId ?? this.routeId,
    );
  }

  @override
  List<Object?> get props => [
        polyLineCoordinates,
        currentLocation,
        zoom,
        currentCameraPosition,
        reportAssigned,
        reportCleaned,
        markerReportLatLng,
        routeId,
      ];
}
