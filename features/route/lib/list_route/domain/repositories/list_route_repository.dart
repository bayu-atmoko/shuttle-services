import 'package:core/core.dart';

import '../../data/models/body/list_route_body.dart';
import '../entities/list_route_entity.dart';

abstract class ListRouteRepository {
  Future<Either<MorphemeFailure, ListRouteEntity>> listRoute(
    ListRouteBody body, {
    Map<String, String>? headers,
  });
}
