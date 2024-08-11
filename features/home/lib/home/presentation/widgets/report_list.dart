import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/domain/entities/list_report_entity.dart';
import 'package:home/home/presentation/widgets/report_item.dart';

class ReportList extends StatelessWidget {
  ReportList({
    super.key,
    required this.data,
  });

  final List<AlphaDataListReport> data;
  final ScrollController controllerScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controllerScroll,
      thickness: MorphemeSizes.s4,
      radius: const Radius.circular(
        MorphemeSizes.s4,
      ),
      trackVisibility: true,
      thumbVisibility: true,
      child: ListView.builder(
        controller: controllerScroll,
        padding: const EdgeInsets.only(
          left: MorphemeSizes.s16,
          right: MorphemeSizes.s16,
          bottom: MorphemeSizes.s16,
          top: MorphemeSizes.s4,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ReportItem(
            reportId: data[index].reportId.toString(),
            desc: data[index].description.orEmpty(),
            type: data[index].complaintTitle.orEmpty(),
            address: data[index].locationAddress.orEmpty(),
            createdAt: data[index].createdAt,
            officer: data[index].officerName.orEmpty(),
            priority: data[index].priority,
          );
        },
      ),
    );
  }
}
