import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/presentation/bloc/cleaned_report/cleaned_report_bloc.dart';
import 'package:home/home/presentation/widgets/report_list.dart';

class CleanedReportPage extends StatelessWidget {
  const CleanedReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reportState = context.watch<CleanedReportBloc>().state;

    return reportState.builder(
      onSuccess: (state) {
        if ((state.data.data?.data ?? []).isNotEmpty) {
          return ReportList(
            data: state.data.data?.data ?? [],
          );
        } else {
          return const MorphemeEmpty();
        }
      },
      onLoading: (state) {
        return const MorphemeCircularLoading(
          size: MorphemeSizes.s80,
          strokeWidth: MorphemeSizes.s6,
        );
      },
      onFailed: (state) {
        return const MorphemeEmpty();
      },
      onInitial: (state) {
        return Container();
      },
    );
  }
}
