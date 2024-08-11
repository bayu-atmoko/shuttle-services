import 'package:core/core.dart';

class DetailRouteBody extends Equatable {
  const DetailRouteBody({
    required this.routeId,
  });

  final String routeId;

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [
        routeId,
      ];
}
