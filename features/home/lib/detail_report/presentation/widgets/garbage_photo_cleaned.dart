import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/detail_report/presentation/cubit/detail_report_cubit.dart';
import 'package:home/detail_report/presentation/widgets/photo_list.dart';

class GarbagePhotoCleaned extends StatelessWidget {
  final String? currentStatus;
  final List<String> garbageCleanedPhoto;
  final bool isOfficer;

  const GarbagePhotoCleaned({
    super.key,
    required this.currentStatus,
    required this.garbageCleanedPhoto,
    required this.isOfficer,
  });

  @override
  Widget build(BuildContext context) {
    final garbageCleanedPhotoFile = context
        .select((DetailReportCubit element) => element.state)
        .garbagePhotoCleanedFile;

    final isPhotoValid = context
        .select((DetailReportCubit element) => element.state)
        .isPhotoValid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// upload button only display if status is cleaned
        if (isOfficer && currentStatus == ReportStatusEnum.cleaned.value) ...[
          _addGarbagePhotoTitle(context),

          const MorphemeSpacing.vertical5(),
          _uploadButton(context),
          if (isPhotoValid == false) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MorphemeSizes.s14,
              ),
              child: MorphemeStatusMessage.error(
                context: context,
                text: context.s.emptyError,
              ),
            )
          ],
          const MorphemeSpacing.vertical8(),

          /// photo list
          ///
          /// cleaned status
          if (garbageCleanedPhotoFile != null &&
              garbageCleanedPhotoFile.isNotEmpty) ...[
            const MorphemeSpacing.vertical5(),
            PhotoList(
              photoFile: garbageCleanedPhotoFile,
              onDeleteTap: (indexFile, _) {
                if (indexFile != null) {
                  context.read<DetailReportCubit>().deletePhoto(indexFile);
                }
              },
              onImageTap: (indexFile, _) {
                if (indexFile != null &&
                    indexFile < garbageCleanedPhotoFile.length) {
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
                      photoFile: garbageCleanedPhotoFile[indexFile],
                      photoUrl: null,
                    ),
                  );
                }
              },
            ),
            const MorphemeSpacing.vertical8(),
          ],

          /// finish status
        ] else if (currentStatus == ReportStatusEnum.finish.value) ...[
          _addGarbagePhotoTitle(context),

          /// photo list
          if (garbageCleanedPhoto.isNotEmpty) ...[
            const MorphemeSpacing.vertical5(),
            PhotoList(
              photoUrl: garbageCleanedPhoto,
              onImageTap: (_, indexUrl) {
                if (indexUrl != null && indexUrl < garbageCleanedPhoto.length) {
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
                      photoUrl: garbageCleanedPhoto[indexUrl],
                    ),
                  );
                }
              },
            ),
            const MorphemeSpacing.vertical8(),

            ///empty photo list
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
        ],
      ],
    );
  }

  Padding _uploadButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MorphemeSizes.s14,
      ),
      child: MorphemeUploadButton(
        heightButton: MorphemeSizes.s40,
        tittleButton: context.s.locationPhotosAreClean,
        onTap: () {
          showModalBottomSheet(
            backgroundColor: context.color.white,
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(MorphemeSizes.s10),
              ),
            ),
            builder: (contextBottomSheet) => MorphemeBottomSheetUploadImage(
              image: null,
              isDeleteMenuVisible: false,
              callbackDelete: (bool value) {},
              callbackImage: (XFile? value) {
                context.read<DetailReportCubit>().updatePhoto(value, context);
              },
            ),
          );
        },
      ),
    );
  }

  Padding _addGarbagePhotoTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MorphemeSizes.s14,
      ),
      child: MorphemeText.titleSmall(
        context.s.photoOfGarbageHasBeenCleaned,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
