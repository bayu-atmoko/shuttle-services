part of 'route_optimization_bloc.dart';

@immutable
abstract class RouteOptimizationEvent extends Equatable {}

class FetchRouteOptimization extends RouteOptimizationEvent {
  FetchRouteOptimization(this.body, {this.headers, this.extra});

  final RouteOptimizationBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
