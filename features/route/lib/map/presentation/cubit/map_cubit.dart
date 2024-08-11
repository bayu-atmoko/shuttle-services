import 'dart:async';
import 'dart:math';

import 'package:core/core.dart';
import 'package:home/home/data/models/body/list_report_body.dart';
import 'package:home/home/domain/entities/list_report_entity.dart';
import 'package:home/home/presentation/bloc/assigned_report/assigned_report_bloc.dart';
import 'package:home/home/presentation/bloc/cleaned_report/cleaned_report_bloc.dart';
import 'package:route/map/data/models/body/distance_matrix_body.dart';
import 'package:route/map/data/models/body/map_routes_body.dart';
import 'package:route/map/domain/entities/map_routes_entity.dart'
    as routes_entity;
import 'package:route/map/presentation/bloc/distance_matrix/distance_matrix_bloc.dart';
import 'package:route/map/presentation/bloc/map_routes/map_routes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:route/route_recommendation/data/models/body/create_route_body.dart';
import 'package:route/route_recommendation/data/models/body/route_optimization_body.dart';
import 'package:route/route_recommendation/domain/entities/route_optimization_entity.dart';
import 'package:route/route_recommendation/presentation/bloc/create_route/create_route_bloc.dart';
import 'package:route/route_recommendation/presentation/bloc/route_optimization/route_optimization_bloc.dart';

part 'map_state.dart';

class MapCubit extends MorphemeCubit<MapStateCubit> {
  MapCubit({
    required this.mapRoutesBloc,
    required this.distanceMatrixBloc,
    required this.routeOptimizationBloc,
    required this.createRouteBloc,
    required this.assignedReportBloc,
    required this.cleanedReportBloc,
  }) : super(const MapStateCubit(
          polyLineCoordinates: [],
          zoom: MorphemeInt.mapsZoom,
        ));

  final MapRoutesBloc mapRoutesBloc;
  final DistanceMatrixBloc distanceMatrixBloc;
  final RouteOptimizationBloc routeOptimizationBloc;
  final CreateRouteBloc createRouteBloc;
  final AssignedReportBloc assignedReportBloc;
  final CleanedReportBloc cleanedReportBloc;

  final Completer<GoogleMapController> controller = Completer();
  bool isInitialCamera = false;

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void initState(BuildContext context) async {
    _getInitialCurrentLocation();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<MapRoutesBloc>(create: (context) => mapRoutesBloc),
        BlocProvider<DistanceMatrixBloc>(
            create: (context) => distanceMatrixBloc),
        BlocProvider<RouteOptimizationBloc>(
            create: (context) => routeOptimizationBloc),
        BlocProvider<CreateRouteBloc>(create: (context) => createRouteBloc),
        BlocProvider<AssignedReportBloc>(
            create: (context) => assignedReportBloc),
        BlocProvider<CleanedReportBloc>(create: (context) => cleanedReportBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<MapRoutesBloc, MapRoutesState>(
            listener: _listenerMapRoutes),
        BlocListener<DistanceMatrixBloc, DistanceMatrixState>(
            listener: _listenerDistanceMatrix),
        BlocListener<RouteOptimizationBloc, RouteOptimizationState>(
            listener: _listenerRouteOptimization),
        BlocListener<CreateRouteBloc, CreateRouteState>(
            listener: _listenerCreateRoute),
        BlocListener<AssignedReportBloc, AssignedReportState>(
            listener: _listenerListReportAssigned),
        BlocListener<CleanedReportBloc, CleanedReportState>(
            listener: _listenerListReportCleaned),
      ];

  @override
  void dispose() {
    mapRoutesBloc.close();
    distanceMatrixBloc.close();
    routeOptimizationBloc.close();
    createRouteBloc.close();
    assignedReportBloc.close();
    cleanedReportBloc.close();
  }

  void _listenerMapRoutes(BuildContext context, MapRoutesState state) {
    state.when(
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        _showTechnicalErrorMessage(context);
      },
      onSuccess: (state) {
        List<routes_entity.LegsMapRoutes>? legs =
            (state.data.routes ?? []).isNotEmpty
                ? state.data.routes!.first.legs
                : [];

        List<routes_entity.StepsMapRoutes>? steps = [];
        for (var element in (legs ?? [])) {
          if (element.steps != null) {
            steps.addAll((element.steps ?? []).toList());
          }
        }

        List<LatLng>? polyLineCoordinates = [];
        for (int i = 0; i < steps.length; i++) {
          polyLineCoordinates.addAll(LatLngUtilHelper.decodeLatLng(
              steps[i].polyline?.encodedPolyline ?? ""));
        }

        emit(this.state.copyWith(
              polyLineCoordinates: polyLineCoordinates,
            ));
      },
    );
  }

  void _showTechnicalErrorMessage(BuildContext context) {
    return context.showSnackBar(
      MorphemeSnackBar.error(
        key: const ValueKey('snackbarError'),
        context: context,
        message: context.s.thereAreTechError,
      ),
    );
  }

  void _listenerDistanceMatrix(
    BuildContext context,
    DistanceMatrixState state,
  ) {
    state.when(
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        _showTechnicalErrorMessage(context);
      },
      onSuccess: (state) {
        final distanceMatrixReportId =
            state.body.origins.map((e) => e.reportId).toList();

        final distanceMatrixRows = state.data.rows;
        List<RowsRouteOptimization> routeOptimizationRows = [];

        distanceMatrixRows?.forEachIndexed((indexRow, element) {
          List<ElementsRouteOptimization> routeOptimizationElements = [];

          element.elements?.forEachIndexed((indexColumn, item) {
            routeOptimizationElements.add(ElementsRouteOptimization(
              originReportId: distanceMatrixReportId[indexRow],
              destinationReportId: distanceMatrixReportId[indexColumn],
              duration: item.duration?.value ?? 0,
              distance: item.distance?.value ?? 0,
            ));
          });

          routeOptimizationRows.add(RowsRouteOptimization(
            elements: routeOptimizationElements,
          ));
        });

        _fetchRouteOptimization(RouteOptimizationBody(
          rows: routeOptimizationRows,
        ));
      },
    );
  }

  void _listenerRouteOptimization(
    BuildContext context,
    RouteOptimizationState state,
  ) {
    state.when(
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        _showTechnicalErrorMessage(context);
      },
      onSuccess: (state) {
        List<LatLng> optimizeLatLng = _getMapRoutesFromReport(
          this.state.reportCleaned ?? [],
          this.state.reportAssigned ?? [],
          state.data.data ?? [],
        );

        _getRouteAndSaveMarker(optimizeLatLng);

        /// ------------------------------------------------------------------------
        /// Create a route in database

        if ((state.data.data ?? []).isNotEmpty) {
          final destinationReportId = state.data.data?.last.destinationReportId;

          final List<RowsRouteOptimization> routeOptimizeBody =
              state.body.rows ?? [];
          final List<ElementsRouteOptimization> routeOptimizeRow1Body =
              routeOptimizeBody.isNotEmpty
                  ? (routeOptimizeBody.first.elements ?? [])
                  : [];
          int? totalDistance;
          int? totalDuration;

          if (routeOptimizeRow1Body.isNotEmpty && destinationReportId != null) {
            final ElementsRouteOptimization? routeOptimizeColumn =
                routeOptimizeRow1Body.firstWhereOrNull((element) =>
                    element.destinationReportId == destinationReportId);
            totalDistance = routeOptimizeColumn?.distance;
            totalDuration = routeOptimizeColumn?.duration;
          }

          if (totalDistance != null && totalDuration != null) {
            _fetchCreateRoute(CreateRouteBody(
              totalDistance: totalDistance,
              totalDuration: totalDuration,
              route: state.data.data,
            ));

            /// close the loading dialog
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }

          /// close the loading dialog
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  void _getRouteAndSaveMarker(List<LatLng> optimizeLatLng) {
    OriginMapRoutes? origin = state.currentLocation?.latitude != null &&
            state.currentLocation?.longitude != null
        ? OriginMapRoutes(
            location: LocationMapRoutes(
              latLng: LatLngMapRoutes(
                latitude: state.currentLocation!.latitude,
                longitude: state.currentLocation!.longitude,
              ),
            ),
          )
        : null;

    OriginMapRoutes? destination;
    List<OriginMapRoutes> intermediates = [];

    for (int i = 0; i < optimizeLatLng.length; i++) {
      /// first location
      if (i == 0 && origin == null) {
        destination = OriginMapRoutes(
          location: LocationMapRoutes(
            latLng: LatLngMapRoutes(
              latitude: optimizeLatLng[i].latitude,
              longitude: optimizeLatLng[i].longitude,
            ),
          ),
        );
      }

      /// last location
      if (i == optimizeLatLng.length - 1) {
        destination = OriginMapRoutes(
          location: LocationMapRoutes(
            latLng: LatLngMapRoutes(
              latitude: optimizeLatLng[i].latitude,
              longitude: optimizeLatLng[i].longitude,
            ),
          ),
        );

        /// intermediates location
      } else {
        intermediates.add(
          OriginMapRoutes(
            location: LocationMapRoutes(
              latLng: LatLngMapRoutes(
                latitude: optimizeLatLng[i].latitude,
                longitude: optimizeLatLng[i].longitude,
              ),
            ),
          ),
        );
      }
    }

    _fetchMapRoutes(
      MapRoutesBody(
        origin: origin,
        destination: destination,
        intermediates: intermediates,
      ),
    );

    /// ------------------------------------------------------------------------

    emit(state.copyWith(
      markerReportLatLng: optimizeLatLng,
    ));
  }

  void _listenerCreateRoute(
    BuildContext context,
    CreateRouteState state,
  ) {
    state.when(
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        _showTechnicalErrorMessage(context);
      },
      onSuccess: (state) {
        Navigator.of(context, rootNavigator: true).pop();

        final List<AlphaDataListReport> report = [
          ...(this.state.reportCleaned ?? []),
          ...(this.state.reportAssigned ?? []),
        ];
        final existingRouteId = report.isNotEmpty ? report.first.routeId : null;

        emit(this.state.copyWith(
              routeId: state.data.data?.routeId ?? existingRouteId,
            ));
      },
    );
  }

  void _fetchMapRoutes(MapRoutesBody body) =>
      mapRoutesBloc.add(FetchMapRoutes(body));

  void _fetchDistanceMatrix(DistanceMatrixBody body) =>
      distanceMatrixBloc.add(FetchDistanceMatrix(body));

  void _fetchRouteOptimization(RouteOptimizationBody body) =>
      routeOptimizationBloc.add(FetchRouteOptimization(body));

  void _fetchCreateRoute(CreateRouteBody body) =>
      createRouteBloc.add(FetchCreateRoute(body));

  void _getInitialCurrentLocation() async {
    Location location = _getLatLngCurrentLocation();

    GoogleMapController googleMapController = await controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        emit(state.copyWith(
          currentLocation: newLoc,
        ));

        if (!isInitialCamera) {
          _moveMapCamera(googleMapController, newLoc);
          isInitialCamera = true;
        }
      },
    );
  }

  void _moveMapCamera(
    GoogleMapController googleMapController,
    LocationData newLoc,
  ) {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: LatLng(
            newLoc.latitude!,
            newLoc.longitude!,
          ),
        ),
      ),
    );
  }

  void updateCamera(LatLng latLng) async {
    (await controller.future).animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onZoomIn() async {
    if (state.currentLocation?.latitude != null &&
        state.currentLocation?.longitude != null) {
      double zoomValue = state.zoom + 1;
      (await controller.future).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            state.currentLocation!.latitude!,
            state.currentLocation!.longitude!,
          ),
          zoom: zoomValue,
        )),
      );
      emit(state.copyWith(zoom: zoomValue));
    }
  }

  void onZoomOut() async {
    if (state.currentLocation?.latitude != null &&
        state.currentLocation?.longitude != null) {
      double zoomValue = state.zoom - 1;
      (await controller.future).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            state.currentLocation!.latitude!,
            state.currentLocation!.longitude!,
          ),
          zoom: zoomValue,
        )),
      );
      emit(state.copyWith(zoom: zoomValue));
    }
  }

  void getCurrentLocation() {
    _getLatLngCurrentLocation();
    _moveToCurrentLocation();
  }

  Location _getLatLngCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        emit(state.copyWith(
          currentLocation: location,
        ));

        /// get report list
        fetchAssignedReport(ListReportBody(
          status: ReportStatusEnum.assigned.value,
        ));
      },
    );
    return location;
  }

  void _moveToCurrentLocation() async {
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(
        state.currentLocation?.latitude ?? 0.0,
        state.currentLocation?.longitude ?? 0.0,
      ),
      state.zoom,
    );
    (await controller.future).animateCamera(cameraUpdate);
  }

  void onCompassPressed() async {
    CameraPosition newPosition = CameraPosition(
      target: state.currentCameraPosition?.target ??
          LatLng(
            state.currentLocation?.latitude ?? 0.0,
            state.currentLocation?.longitude ?? 0.0,
          ),
      zoom: state.zoom,
      bearing: 0,
      tilt: 0,
    );
    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
    (await controller.future).animateCamera(cameraUpdate);
  }

  void changeCameraPositionState(CameraPosition position) {
    emit(state.copyWith(
      currentCameraPosition: position,
    ));
  }

  void fetchAssignedReport(ListReportBody body) {
    assignedReportBloc.add(FetchAssignedReport(body));
  }

  void _listenerListReportAssigned(
      BuildContext context, AssignedReportState state) {
    state.when(
      onLoading: (_) =>
          MorphemeCircularLoadingDialog.showLoadingDialog(context, _keyLoader),
      onFailed: (state) {
        Navigator.of(context, rootNavigator: true).pop();
        context.showSnackBar(
          MorphemeSnackBar.error(
            key: const ValueKey('snackbarError'),
            context: context,
            message: context.s.thereAreTechError,
          ),
        );
      },
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportAssigned: state.data.data?.data,
            ));
        _fetchCleanedReport(ListReportBody(
          status: ReportStatusEnum.cleaned.value,
        ));
      },
    );
  }

  void _fetchCleanedReport(ListReportBody body) {
    cleanedReportBloc.add(FetchCleanedReport(body));
  }

  void _listenerListReportCleaned(
      BuildContext context, CleanedReportState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              reportCleaned: state.data.data?.data,
            ));

        _fetchMultipleRoute(context);
      },
    );
  }

  void _fetchMultipleRoute(
    BuildContext context,
  ) {
    // TODO task maksimal per petugas yaitu 10

    List<DistanceMatrixModel?> cleanedDistanceMatrix =
        _getDistanceMatrixFromReport(state.reportCleaned ?? []);
    List<DistanceMatrixModel?> assignedDistanceMatrix =
        _getDistanceMatrixFromReport(state.reportAssigned ?? []);

    List<DistanceMatrixModel> reportDistanceMatrix = [];
    for (var element in cleanedDistanceMatrix) {
      if (element != null) {
        reportDistanceMatrix.add(element);
      }
    }
    for (var element in assignedDistanceMatrix) {
      if (element != null) {
        reportDistanceMatrix.add(element);
      }
    }

    /// officer only have task with maximal 10
    List<DistanceMatrixModel> finalDistanceMatrixData =
        reportDistanceMatrix.take(10).toList();

    /// ------------------------------------------------------------------------

    /// Current location
    Map<String, double>? myLocation;
    if (state.currentLocation?.latitude != null &&
        state.currentLocation?.longitude != null) {
      myLocation = {
        'lat': state.currentLocation!.latitude!,
        'lng': state.currentLocation!.longitude!,
      };
    }

    List<Map<String, double>> locations = finalDistanceMatrixData
        .map((e) => {
              'lat': e.latLng.latitude,
              'lng': e.latLng.longitude,
            })
        .toList();

    Map<String, double>? nearestLocation;
    double shortestDistance = double.infinity;

    if (myLocation != null) {
      // Loop through all locations to find the nearest one
      for (var location in locations) {
        double distance = haversine(
          myLocation['lat']!,
          myLocation['lng']!,
          location['lat']!,
          location['lng']!,
        );
        if (distance < shortestDistance) {
          shortestDistance = distance;
          nearestLocation = location;
        }
      }
    }

    if (nearestLocation != null) {
      List<DistanceMatrixModel> nearestDistanceMatrixData =
          finalDistanceMatrixData
              .where((element) =>
                  element.latLng.latitude == nearestLocation!['lat'] &&
                  element.latLng.longitude == nearestLocation['lng'])
              .toList();
      nearestDistanceMatrixData.addAll(
        finalDistanceMatrixData.whereNot((element) =>
            element.latLng.latitude == nearestLocation!['lat'] &&
            element.latLng.longitude == nearestLocation['lng']),
      );

      _getDistanceMatrixOrRoute(context, nearestDistanceMatrixData);

      ///
    } else {
      _getDistanceMatrixOrRoute(context, finalDistanceMatrixData);
    }
  }

  void _getDistanceMatrixOrRoute(
    BuildContext context,
    List<DistanceMatrixModel> finalDistanceMatrixData,
  ) {
    /// show route for many report locations
    if (finalDistanceMatrixData.length > 1) {
      _fetchDistanceMatrix(DistanceMatrixBody(
        origins: finalDistanceMatrixData,
        destinations: finalDistanceMatrixData,
      ));

      /// show route from your location to the report location
    } else if (finalDistanceMatrixData.length == 1) {
      _getRouteAndSaveMarker(
        finalDistanceMatrixData.map((e) => e.latLng).toList(),
      );
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  List<DistanceMatrixModel?> _getDistanceMatrixFromReport(
      List<AlphaDataListReport> data) {
    return data
        .map(
          (e) {
            try {
              return e.locationLatitude != null &&
                      e.locationLongitude != null &&
                      e.reportId != null
                  ? DistanceMatrixModel(
                      reportId: e.reportId!,
                      latLng: LatLng(
                        e.locationLatitude!.toDouble(),
                        e.locationLongitude!.toDouble(),
                      ),
                    )
                  : null;
            } catch (_) {
              return null;
            }
          },
        )
        .skipWhile((e) => e == null)
        .toList();
  }

  List<LatLng> _getMapRoutesFromReport(
    List<AlphaDataListReport> reportCleaned,
    List<AlphaDataListReport> reportAssigned,
    List<DataRouteOptimization> optimizeList,
  ) {
    List<LatLng> result = [];

    List<AlphaDataListReport> report = [
      ...reportCleaned,
      ...reportAssigned,
    ];

    optimizeList.forEachIndexed((index, item) {
      for (var element in report) {
        if (index == 0) {
          _insertOptimizeLatLng(
            item.originReportId,
            element,
            result,
          );
        }
      }
    });

    optimizeList.forEachIndexed((index, item) {
      for (var element in report) {
        _insertOptimizeLatLng(
          item.destinationReportId,
          element,
          result,
        );
      }
    });

    return result;
  }

  void _insertOptimizeLatLng(
    int? destinationReportId,
    AlphaDataListReport element,
    List<LatLng> result,
  ) {
    if (destinationReportId != null &&
        destinationReportId == element.reportId &&
        element.locationLatitude != null &&
        element.locationLongitude != null) {
      result.add(
        LatLng(
          element.locationLatitude!.toDouble(),
          element.locationLongitude!.toDouble(),
        ),
      );
    }
  }

  // Function to calculate the distance between two points using the Haversine Formula
  double haversine(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Earth radius in kilometers

    double dLat = _degToRad(lat2 - lat1);
    double dLon = _degToRad(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) *
            cos(_degToRad(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;

    return distance;
  }

  // Function to convert degrees to radians
  double _degToRad(double degree) {
    return degree * (pi / 180);
  }
}
