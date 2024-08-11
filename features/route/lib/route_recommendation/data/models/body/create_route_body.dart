import 'package:core/core.dart';
import 'package:route/route_recommendation/domain/entities/route_optimization_entity.dart';

class CreateRouteBody extends Equatable {
  const CreateRouteBody({
    required this.totalDistance,
    required this.totalDuration,
    required this.route,
  });

  final int? totalDistance;
  final int? totalDuration;
  final List<DataRouteOptimization>? route;

  Map<String, dynamic> toMap() {
    return {
      if (totalDistance != null) 'total_distance': totalDistance,
      if (totalDuration != null) 'total_duration': totalDuration,
      if (route != null) 'route': route?.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        totalDistance,
        totalDuration,
        route,
      ];
}
