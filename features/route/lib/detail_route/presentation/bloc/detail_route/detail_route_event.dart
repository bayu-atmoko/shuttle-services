part of 'detail_route_bloc.dart';

@immutable
abstract class DetailRouteEvent extends Equatable {}

class FetchDetailRoute extends DetailRouteEvent {
  FetchDetailRoute(this.body, {this.headers, this.extra});

  final DetailRouteBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}
