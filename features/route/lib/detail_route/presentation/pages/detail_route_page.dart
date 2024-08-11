import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:route/detail_route/presentation/bloc/detail_route/detail_route_bloc.dart';
import 'package:route/detail_route/presentation/widgets/route_list.dart';

import '../cubit/detail_route_cubit.dart';

class DetailRoutePage extends StatefulWidget {
  const DetailRoutePage({
    super.key,
    required this.routeId,
  });

  final String routeId;

  @override
  State<DetailRoutePage> createState() => _DetailRoutePageState();
}

class _DetailRoutePageState extends State<DetailRoutePage>
    with MorphemeStatePage<DetailRoutePage, DetailRouteCubit> {
  @override
  DetailRouteCubit setCubit() => locator<DetailRouteCubit>();

  @override
  Widget buildWidget(BuildContext context) {
    final detailState = context.watch<DetailRouteBloc>().state;
    final data =
        context.select((DetailRouteCubit element) => element.state).route;

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.detailRouteRecommendation,
      background: context.color.white,
      isScroll: false,
      child: detailState is DetailRouteLoading
          ? const Center(
              child: MorphemeCircularLoading(
                size: MorphemeSizes.s80,
                strokeWidth: MorphemeSizes.s6,
              ),
            )
          : ReportList(data: data),
    );
  }
}
