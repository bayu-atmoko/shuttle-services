import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/detail_route/data/models/body/detail_route_body.dart';
import 'package:route/detail_route/domain/entities/detail_route_entity.dart';
import 'package:route/detail_route/presentation/bloc/detail_route/detail_route_bloc.dart';

import '../pages/detail_route_page.dart';

part 'detail_route_state.dart';

class DetailRouteCubit extends MorphemeCubit<DetailRouteStateCubit> {
  DetailRouteCubit({
    required this.detailRouteBloc,
  }) : super(const DetailRouteStateCubit());

  final DetailRouteBloc detailRouteBloc;

  @override
  void initArgument<Page>(BuildContext context, Page widget) {
    super.initArgument(context, widget);
    if (widget is! DetailRoutePage) return;
    _fetchDetailRoute(widget.routeId);
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<DetailRouteBloc>(create: (context) => detailRouteBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<DetailRouteBloc, DetailRouteState>(
            listener: _listenerDetailRoute),
      ];

  @override
  void dispose() {
    detailRouteBloc.close();

    super.dispose();
  }

  void _fetchDetailRoute(String routeId) {
    detailRouteBloc.add(FetchDetailRoute(DetailRouteBody(
      routeId: routeId.orEmpty(),
    )));
  }

  void _listenerDetailRoute(BuildContext context, DetailRouteState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              route: state.data.data,
            ));
      },
    );
  }
}
