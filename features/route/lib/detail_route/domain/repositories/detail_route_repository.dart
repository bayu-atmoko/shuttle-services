import 'package:core/core.dart';

import '../../data/models/body/detail_route_body.dart';
import '../entities/detail_route_entity.dart';

abstract class DetailRouteRepository {
  Future<Either<MorphemeFailure, DetailRouteEntity>> detailRoute(
    DetailRouteBody body, {
    Map<String, String>? headers,
  });
}
