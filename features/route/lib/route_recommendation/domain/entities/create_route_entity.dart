import 'package:core/core.dart';

class CreateRouteEntity extends Equatable {
  const CreateRouteEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final DataCreateRoute? data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class DataCreateRoute extends Equatable {
  const DataCreateRoute({
    required this.routeId,
  });

  final int? routeId;

  @override
  List<Object?> get props => [
        routeId,
      ];
}
