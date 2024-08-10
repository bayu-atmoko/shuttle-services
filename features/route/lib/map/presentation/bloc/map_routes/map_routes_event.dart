part of 'map_routes_bloc.dart';

@immutable
abstract class MapRoutesEvent extends Equatable {}

class FetchMapRoutes extends MapRoutesEvent {
  FetchMapRoutes(this.body);

  final MapRoutesBody body;

  @override
  List<Object?> get props => [body];
}
