import 'package:core/core.dart';

import 'presentation/cubit/detail_maps_cubit.dart';

void setupLocatorDetailMaps() {
  // *Cubit
  locator.registerFactory(() => DetailMapsCubit());
}
