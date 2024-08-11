import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home/presentation/cubit/home_cubit.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
    required this.reportId,
    required this.desc,
    required this.type,
    required this.address,
    required this.createdAt,
    this.officer,
    this.priority,
  });

  final String reportId;
  final String desc;
  final String type;
  final String address;
  final DateTime? createdAt;
  final String? officer;
  final int? priority;

  @override
  Widget build(BuildContext context) {
    final userRole = context.select((HomeCubit element) => element.userRole);
    final isUserOfficer =
        userRole.orEmpty().toLowerCase() == UserRoleEnum.petugas.value;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: MorphemeSizes.s6),
      elevation: MorphemeSizes.s2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: MorphemeSizes.s1,
          color: context.color.grey2,
        ),
        borderRadius: BorderRadius.circular(
          MorphemeSizes.s8,
        ),
      ),
      child: MorphemeTapDetector(
        onTap: () async {
          final isRefresh = await context.goToDetailReport(reportId);

          if (isRefresh == true) {
            // ignore: use_build_context_synchronously
            context.read<HomeCubit>().getReportList();
          }
        },
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            minHeight: MorphemeSizes.s100,
          ),
          decoration: BoxDecoration(
            color: context.color.white,
            borderRadius: BorderRadius.circular(
              MorphemeSizes.s8,
            ),
          ),
          padding: const EdgeInsets.all(MorphemeSizes.s12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: MorphemeText.titleSmall(
                      type,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                  ),
                  MorphemeText.bodySmall(
                    createdAt != null
                        ? DateTimeHelper.convertDateTimeToString(
                            date: createdAt!,
                            formatOutput: dateDDMMYYYYHHMMStrip,
                          )
                        : '',
                    maxLines: 1,
                  ),
                ],
              ),
              const MorphemeSpacing.vertical4(),
              MorphemeText.bodySmall(
                desc,
                maxLines: 2,
              ),
              MorphemeText.bodySmall(
                address,
                maxLines: 2,
              ),
              const MorphemeSpacing.vertical4(),

              /// people user
              if (officer.isNotNullOrEmpty && !isUserOfficer) ...[
                _officerInformation(context, isUserOfficer)

                /// officer user
              ] else if (priority != null && isUserOfficer) ...[
                _officerInformation(context, isUserOfficer)
              ]
            ],
          ),
        ),
      ),
    );
  }

  Row _officerInformation(BuildContext context, bool isUserOfficer) {
    return Row(
      children: [
        Icon(
          isUserOfficer ? Icons.report_outlined : Icons.account_box,
          size: MorphemeSizes.s24,
        ),
        const MorphemeSpacing.horizontal4(),
        MorphemeText.bodySmall(
          isUserOfficer
              ? ReportPriorityEnumHelper.getEnumBasedOnValue(
                    priority ?? 3,
                  )?.title ??
                  ''
              : "${context.s.officer} : ",
          fontWeight: FontWeight.bold,
        ),
        MorphemeText.bodySmall(
          isUserOfficer ? '' : officer!.orEmpty(),
          maxLines: 1,
        ),
      ],
    );
  }
}
