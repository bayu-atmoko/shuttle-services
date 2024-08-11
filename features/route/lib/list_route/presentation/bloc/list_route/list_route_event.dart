part of 'list_route_bloc.dart';

@immutable
abstract class ListRouteEvent extends Equatable {}

class FetchListRoute extends ListRouteEvent {
  FetchListRoute(this.body, {this.headers, this.extra});

  final ListRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
