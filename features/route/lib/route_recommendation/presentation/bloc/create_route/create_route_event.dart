part of 'create_route_bloc.dart';

@immutable
abstract class CreateRouteEvent extends Equatable {}

class FetchCreateRoute extends CreateRouteEvent {
  FetchCreateRoute(this.body, {this.headers, this.extra});

  final CreateRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
