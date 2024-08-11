part of 'detail_route_cubit.dart';

class DetailRouteStateCubit extends Equatable {
  const DetailRouteStateCubit({
    this.route,
  });

  final DataDetailRoute? route;

  DetailRouteStateCubit copyWith({
    DataDetailRoute? route,
  }) {
    return DetailRouteStateCubit(
      route: route ?? this.route,
    );
  }

  @override
  List<Object?> get props => [
        route,
      ];
}
