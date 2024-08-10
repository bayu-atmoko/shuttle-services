part of 'map_cubit.dart';

class MapStateCubit extends Equatable {
  const MapStateCubit({
    required this.polyLineCoordinates,
    this.currentLocation,
    required this.zoom,
    this.currentCameraPosition,
    this.markerReportLatLng,
    this.routeId,
  });

  /// maps
  final List<LatLng> polyLineCoordinates;
  final LocationData? currentLocation;
  final double zoom;
  final CameraPosition? currentCameraPosition;
  
  final List<LatLng>? markerReportLatLng;

  // route
  final int? routeId;

  MapStateCubit copyWith({
    List<LatLng>? polyLineCoordinates,
    LocationData? currentLocation,
    double? zoom,
    CameraPosition? currentCameraPosition,
    List<LatLng>? markerReportLatLng,
    int? routeId,
  }) {
    return MapStateCubit(
      polyLineCoordinates: polyLineCoordinates ?? this.polyLineCoordinates,
      currentLocation: currentLocation ?? this.currentLocation,
      zoom: zoom ?? this.zoom,
      currentCameraPosition:
          currentCameraPosition ?? this.currentCameraPosition,
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
        markerReportLatLng,
        routeId,
      ];
}
