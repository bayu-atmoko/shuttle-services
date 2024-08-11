import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/detail_report/domain/entities/detail_report_entity.dart';
import 'package:home/detail_report/presentation/bloc/detail_report/detail_report_bloc.dart';
import 'package:home/detail_report/presentation/widgets/clean_button.dart';
import 'package:home/detail_report/presentation/widgets/garbage_photo_cleaned.dart';
import 'package:home/detail_report/presentation/widgets/maps_button.dart';
import 'package:home/detail_report/presentation/widgets/photo_list.dart';
import 'package:home/detail_report/mapper.dart';

import '../cubit/detail_report_cubit.dart';

class DetailReportPage extends StatefulWidget {
  const DetailReportPage({
    super.key,
    required this.reportId,
  });

  final String reportId;

  @override
  State<DetailReportPage> createState() => _DetailReportPageState();
}

class _DetailReportPageState extends State<DetailReportPage>
    with MorphemeStatePage<DetailReportPage, DetailReportCubit> {
  @override
  DetailReportCubit setCubit() =>
      locator<DetailReportCubit>()..initialData(widget.reportId);

  @override
  Widget buildWidget(BuildContext context) {
    final detailState = context.watch<DetailReportBloc>().state;

    final report =
        context.select((DetailReportCubit element) => element.state).report;
    final userRole =
        context.select((DetailReportCubit element) => element.state).userRole;
    final isOfficer =
        userRole.orEmpty().toLowerCase() == UserRoleEnum.petugas.value;

    final address = report?.location?.address ?? '';
    final district = report?.location?.district ?? '';
    final village = report?.location?.village ?? '';
    final fullAddress = '$address, $district, $village';

    final garbagePhoto = report?.reportMedia
            ?.map((e) => e.mediaPath.orEmpty())
            .skipWhile((value) => value.isNullOrEmpty)
            .toList() ??
        [];
    final garbageCleanedPhoto = report?.garbagePhotoCleaned
            ?.map((e) => e.mediaPath.orEmpty())
            .skipWhile((value) => value.isNullOrEmpty)
            .toList() ??
        [];

    final String? currentStatus = report?.report?.status?.toLowerCase();

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.detailReport,
      isScroll: true,
      actionsAppBar: _headerButtonWidget(
        currentStatus,
        report,
        context,
      ),
      bottomSheet: _footerButtonWidget(
        isOfficer,
        currentStatus,
        context,
        report,
      ),

      /// body page
      child: detailState is DetailReportLoading
          ? const Padding(
              padding: EdgeInsets.only(top: MorphemeSizes.s200),
              child: MorphemeCircularLoading(
                size: MorphemeSizes.s80,
                strokeWidth: MorphemeSizes.s6,
              ),
            )
          : _bodyPage(
              report,
              context,
              fullAddress,
              garbagePhoto,
              garbageCleanedPhoto,
              currentStatus,
              isOfficer,
            ),
    );
  }

  CleanButton? _footerButtonWidget(
    bool isOfficer,
    String? currentStatus,
    BuildContext context,
    DataDetailReport? report,
  ) {
    return isOfficer

        /// clean button
        ? currentStatus == ReportStatusEnum.assigned.value
            ? CleanButton(
                title: context.s.cleanUp,
                cancelTitle: context.s.reject,
                onCancelPressed: () => _showBottomSheetReject(context),
                onPressed: () =>
                    MorphemeShowBottomSheet().showGlobalBottomSheet2Button(
                  context,
                  tittle: context.s.doYouWantToStartCleanGarbage,
                  onPressed2: () {
                    Navigator.of(context).pop();
                    context.read<DetailReportCubit>().onCleanButtonClicked();
                  },
                ),
              )

            /// finish button
            : currentStatus == ReportStatusEnum.cleaned.value
                ? CleanButton(
                    title: context.s.finish2,
                    cancelTitle: context.s.reject,
                    onCancelPressed: () => _showBottomSheetReject(context),
                    onPressed: () =>
                        MorphemeShowBottomSheet().showGlobalBottomSheet2Button(
                      context,
                      tittle: context.s.doYouWantToFinishCleanGarbage,
                      onPressed2: () {
                        Navigator.of(context).pop();
                        context
                            .read<DetailReportCubit>()
                            .onFinishButtonPressed(context);
                      },
                    ),
                  )
                : null

        /// edit button
        : currentStatus == ReportStatusEnum.newReport.value
            ? CleanButton(
                title: context.s.editReport,
                cancelTitle: context.s.cancelIt,
                onCancelPressed: () => _showBottomSheetReject(
                  context,
                  tittle: context.s.doYouWantToCancelReport,
                  confirmationHint: context.s.enterCancelReason,
                ),
                onPressed: () async {
                  if (report?.report != null) {
                    final reportParams = report?.report?.toPageParams();
                    final locationParams = report?.location?.toPageParams();
                    final mediaParams = report?.reportMedia
                        ?.map((e) => e.toPageParams())
                        .toList();

                    final pageParams = ExtraEditReport(
                      reportId: reportParams?.reportId,
                      status: reportParams?.status,
                      description: reportParams?.description,
                      complaintId: reportParams?.complaintId,
                      location: locationParams,
                      media: mediaParams,
                    );

                    final isRefresh = await context.goToEditReport(pageParams);

                    if (isRefresh == true) {
                      // ignore: use_build_context_synchronously
                      context.read<DetailReportCubit>().fetchDetailReport();
                    }
                  }
                },
              )
            : null;
  }

  Future<dynamic> _showBottomSheetReject(
    BuildContext context, {
    String? tittle,
    String? confirmationHint,
  }) {
    return MorphemeShowBottomSheet().showGlobalBottomSheetConfirmation(
      context,
      tittle: tittle ?? context.s.doYouWantToRejectReport,
      confirmationHint: confirmationHint ?? context.s.enterRejectReason,
      onPressed2Confirmation: (value) {
        Navigator.of(context).pop();
        context.read<DetailReportCubit>().onCancelButtonClicked(value);
      },
    );
  }

  List<Widget>? _headerButtonWidget(
    String? currentStatus,
    DataDetailReport? report,
    BuildContext context,
  ) {
    return currentStatus == ReportStatusEnum.newReport.value
        ? [
            /// delete button
            MorphemeTapDetector(
              onTap: () =>
                  MorphemeShowBottomSheet().showGlobalBottomSheet2Button(
                context,
                tittle: context.s.doYouWantToDeleteTheReport,
                onPressed2: () {
                  Navigator.of(context).pop();
                  context.read<DetailReportCubit>().fetchDeleteReport();
                },
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: MorphemeSizes.s5,
                  right: MorphemeSizes.s16,
                  top: MorphemeSizes.s10,
                  bottom: MorphemeSizes.s10,
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  size: MorphemeSizes.s22,
                ),
              ),
            )
          ]
        : null;
  }

  Padding _bodyPage(
    DataDetailReport? report,
    BuildContext context,
    String fullAddress,
    List<String> garbagePhoto,
    List<String> garbageCleanedPhoto,
    String? currentStatus,
    bool isOfficer,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: MorphemeSizes.s16,
        right: MorphemeSizes.s16,
        top: MorphemeSizes.s14,
        bottom: MorphemeSizes.s14 +

            /// bottom sheet margin
            ///
            /// officer user
            ((isOfficer &&
                        (currentStatus == ReportStatusEnum.assigned.value ||
                            currentStatus == ReportStatusEnum.cleaned.value)) ||

                    /// people user
                    (!isOfficer &&
                        currentStatus == ReportStatusEnum.newReport.value)
                ? MorphemeSizes.s80
                : 0),
      ),
      child: Card(
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
          padding: const EdgeInsets.symmetric(
            vertical: MorphemeSizes.s12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MorphemeSizes.s14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MorphemeText.titleSmall(
                                context.s.typeOfComplaint,
                                fontWeight: FontWeight.bold,
                              ),
                              MorphemeText.bodySmall(
                                report?.report?.complaintTitle ?? '-',
                                maxLines: 3,
                              ),
                              const MorphemeSpacing.vertical8(),
                            ],
                          ),
                        ),
                        ReportStatusHelper.determineStatus(
                          context,
                          report?.report?.status ?? '',
                        ),
                      ],
                    ),
                    MorphemeText.titleSmall(
                      context.s.description,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.description ?? '-',
                      maxLines: 5,
                    ),
                    const MorphemeSpacing.vertical8(),
                    if (isOfficer) ...[
                      MorphemeText.titleSmall(
                        context.s.priorityScale,
                        fontWeight: FontWeight.bold,
                      ),
                      MorphemeText.bodySmall(
                        ReportPriorityEnumHelper.getEnumBasedOnValue(
                              report?.report?.priority ?? 3,
                            )?.title ??
                            '-',
                        maxLines: 1,
                      ),
                      const MorphemeSpacing.vertical8(),
                    ],
                    if ((report?.report?.cancellationReason ?? '')
                        .isNotNullOrEmpty) ...[
                      MorphemeText.titleSmall(
                        context.s.cancelReason,
                        fontWeight: FontWeight.bold,
                      ),
                      MorphemeText.bodySmall(
                        report?.report?.cancellationReason ?? '-',
                        maxLines: 5,
                      ),
                      const MorphemeSpacing.vertical8(),
                    ],
                    MorphemeText.titleSmall(
                      context.s.reportDate,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.createdAt == null
                          ? '-'
                          : DateTimeHelper.convertDateStringToString(
                              date:
                                  (report?.report?.createdAt ?? '').toString(),
                              formatOutput: dateDDMONTHYYYYHHMMText,
                              formatInput: dateYYYYMMDDHHMMSSStrip,
                            ),
                      maxLines: 3,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.cleanedDate,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.finishedAt == null
                          ? '-'
                          : DateTimeHelper.convertDateStringToString(
                              date:
                                  (report?.report?.finishedAt ?? '').toString(),
                              formatOutput: dateDDMONTHYYYYHHMMText,
                              formatInput: dateYYYYMMDDHHMMSSStrip,
                            ),
                      maxLines: 3,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.reporter,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.creatorName ?? '-',
                      maxLines: 3,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.reporterPhone,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.creatorPhone ?? '-',
                      maxLines: 3,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.officer,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      report?.report?.officerName ?? '-',
                      maxLines: 3,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.address,
                      fontWeight: FontWeight.bold,
                    ),
                    MorphemeText.bodySmall(
                      fullAddress,
                      maxLines: 5,
                    ),
                    const MorphemeSpacing.vertical8(),
                    MorphemeText.titleSmall(
                      context.s.mapsLocation,
                      fontWeight: FontWeight.bold,
                    ),
                    const MorphemeSpacing.vertical5(),
                    MapsButton(
                      onTap: () {
                        /// route page
                        if (isOfficer &&
                            (currentStatus == ReportStatusEnum.assigned.value ||
                                currentStatus ==
                                    ReportStatusEnum.cleaned.value)) {
                          context.goToMap();

                          ///
                        } else {
                          final locationLatLng =
                              report?.location?.latitude != null &&
                                      report?.location?.longitude != null
                                  ? LatLng(
                                      report!.location!.latitude!,
                                      report.location!.longitude!,
                                    )
                                  : null;

                          /// detail maps page
                          if (locationLatLng != null) {
                            context.goToDetailMaps(locationLatLng);

                            /// toast error
                          } else {
                            context.showSnackBar(
                              MorphemeSnackBar.error(
                                key: const ValueKey('snackbarError'),
                                context: context,
                                message:
                                    context.s.reportDoesNotHaveCoordinatePoint,
                              ),
                            );
                          }
                        }
                      },
                    ),
                    const MorphemeSpacing.vertical10(),
                    MorphemeText.titleSmall(
                      context.s.garbagePhoto,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              if (garbagePhoto.isNotEmpty) ...[
                const MorphemeSpacing.vertical5(),
                PhotoList(
                  photoUrl: garbagePhoto,
                  onImageTap: (_, indexUrl) {
                    if (indexUrl != null && indexUrl < garbagePhoto.length) {
                      showModalBottomSheet(
                        backgroundColor: context.color.white,
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(MorphemeSizes.s10),
                          ),
                        ),
                        builder: (contextBottomSheet) =>
                            MorphemeBottomSheetFullImage(
                          photoFile: null,
                          photoUrl: garbagePhoto[indexUrl],
                        ),
                      );
                    }
                  },
                ),
              ] else ...[
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MorphemeSizes.s14,
                  ),
                  child: MorphemeText.bodySmall(
                    '-',
                  ),
                ),
              ],
              const MorphemeSpacing.vertical10(),

              /// photo of garbage has been cleaned
              if (currentStatus == ReportStatusEnum.cleaned.value ||
                  currentStatus == ReportStatusEnum.finish.value) ...[
                GarbagePhotoCleaned(
                  currentStatus: currentStatus,
                  garbageCleanedPhoto: garbageCleanedPhoto,
                  isOfficer: isOfficer,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
