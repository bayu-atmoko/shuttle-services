part of 'update_route_bloc.dart';

@immutable
abstract class UpdateRouteEvent extends Equatable {}

class FetchUpdateRoute extends UpdateRouteEvent {
  FetchUpdateRoute(this.body, {this.headers, this.extra});

  final UpdateRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
