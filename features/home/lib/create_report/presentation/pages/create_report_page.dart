import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/create_report/presentation/bloc/create_report/create_report_bloc.dart';
import 'package:home/detail_report/presentation/widgets/photo_list.dart';
import 'package:home/finish_report/presentation/bloc/edit_report/edit_report_bloc.dart';
import 'package:main/upload_file/presentation/bloc/upload_file/upload_file_bloc.dart';

import '../cubit/create_report_cubit.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({
    super.key,
    this.editReportData,
  });

  final ExtraEditReport? editReportData;

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage>
    with MorphemeStatePage<CreateReportPage, CreateReportCubit> {
  @override
  CreateReportCubit setCubit() =>
      locator<CreateReportCubit>()..initialData(widget.editReportData);

  @override
  Widget buildWidget(BuildContext context) {
    final createReportBloc = context.watch<CreateReportBloc>().state;
    final editReportBloc = context.watch<EditReportBloc>().state;
    final uploadFileState = context.watch<UploadFileBloc>().state;

    final descriptionKey =
        context.select((CreateReportCubit element) => element.descriptionKey);
    final addressKey =
        context.select((CreateReportCubit element) => element.addressKey);
    final mapsKey =
        context.select((CreateReportCubit element) => element.mapsKey);

    final isDistrictValid = context
        .select((CreateReportCubit element) => element.state)
        .isDistrictValid;
    final isVillageValid = context
        .select((CreateReportCubit element) => element.state)
        .isVillageValid;
    final isPhotoValid = context
        .select((CreateReportCubit element) => element.state)
        .isPhotoValid;

    final district =
        context.select((CreateReportCubit element) => element.state).district;
    final village =
        context.select((CreateReportCubit element) => element.state).village;

    final districtDropdownList = context
        .select((CreateReportCubit element) => element.state)
        .districtDropdownList;
    final villageDropdownList = context
        .select((CreateReportCubit element) => element.state)
        .villageDropdownList;

    final photoFile =
        context.select((CreateReportCubit element) => element.state).photoFile;
    final photoUrl =
        context.select((CreateReportCubit element) => element.state).photoUrl;

    final locationName = context
        .select((CreateReportCubit element) => element.state)
        .locationName;
    final latitude =
        context.select((CreateReportCubit element) => element.state).latitude;
    final longitude =
        context.select((CreateReportCubit element) => element.state).longitude;

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.reportForm,
      isExpanded: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: MorphemeSizes.s16,
              right: MorphemeSizes.s16,
              top: MorphemeSizes.s16,
            ),
            child: Column(
              children: [
                MorphemeTextField(
                  key: descriptionKey,
                  title: context.s.problemDescription,
                  keyboardType: TextInputType.text,
                  decoration:
                      InputDecoration(hintText: context.s.enterProblemDesc),
                  validator: ValidatorValueHelper.validatorEmpty,
                  textInputAction: TextInputAction.next,
                  maxLines: 4,
                ),
                const MorphemeSpacing.vertical16(),
                MorphemeDropdown<String>(
                  title: context.s.district,
                  hintText: context.s.selectDistrict,
                  isValid: isDistrictValid,
                  value: district,
                  items: districtDropdownList
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: MorphemeSizes.s16,
                              ),
                              child: MorphemeText.titleMedium(
                                e,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => context
                      .read<CreateReportCubit>()
                      .onDistrictChanged(value.orEmpty()),
                ),
                const MorphemeSpacing.vertical16(),
                MorphemeDropdown<String>(
                  title: context.s.village,
                  hintText: context.s.selectVillage,
                  isValid: isVillageValid,
                  value: village,
                  items: villageDropdownList
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: MorphemeSizes.s16,
                              ),
                              child: MorphemeText.titleMedium(
                                e,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) => context
                      .read<CreateReportCubit>()
                      .onVillageChanged(value.orEmpty()),
                ),
                const MorphemeSpacing.vertical16(),
                MorphemeTextField(
                  key: addressKey,
                  title: context.s.address,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: context.s.enterAddress),
                  validator: ValidatorValueHelper.validatorEmpty,
                  maxLines: 4,
                ),
                const MorphemeSpacing.vertical16(),
                MorphemeTapDetector(
                  onTap: () async {
                    final result =
                        await context.goToMapsPlacePicker(ExtraPlacePicker(
                      locationName: locationName,
                      locationLatLng: latitude != null && longitude != null
                          ? LatLng(
                              latitude,
                              longitude,
                            )
                          : null,
                    ));

                    if (result != null) {
                      // ignore: use_build_context_synchronously
                      context
                          .read<CreateReportCubit>()
                          .onLocationMapsChanged(result);
                    }
                  },
                  child: MorphemeTextField(
                    key: mapsKey,
                    title: context.s.mapsLocation,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    style: TextStyle(
                      color: context.color.black,
                    ),
                    decoration: InputDecoration(
                      hintText: context.s.selectLocationInMaps,
                      enabled: false,
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: context.color.black,
                        size: MorphemeSizes.s24,
                      ),
                    ),
                    validator: ValidatorValueHelper.validatorEmpty,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const MorphemeSpacing.vertical16(),
                MorphemeUploadButton(
                  tittle: context.s.garbagePhoto,
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
                      builder: (contextBottomSheet) =>
                          MorphemeBottomSheetUploadImage(
                        image: null,
                        isDeleteMenuVisible: false,
                        callbackDelete: (bool value) {},
                        callbackImage: (XFile? value) {
                          context
                              .read<CreateReportCubit>()
                              .updatePhotoFile(value, context);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if ((photoFile != null && photoFile.isNotEmpty) ||
              (photoUrl != null && photoUrl.isNotEmpty)) ...[
            const MorphemeSpacing.vertical16(),
            PhotoList(
              padding: const EdgeInsets.symmetric(
                horizontal: MorphemeSizes.s10,
              ),
              photoFile: photoFile,
              photoUrl: photoUrl,
              onDeleteTap: (indexFile, indexUrl) {
                if (indexFile != null) {
                  context.read<CreateReportCubit>().deletePhotoFile(indexFile);
                } else if (indexUrl != null) {
                  context.read<CreateReportCubit>().deletePhotoUrl(indexUrl);
                }
              },
              onImageTap: (indexFile, indexUrl) => showModalBottomSheet(
                backgroundColor: context.color.white,
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(MorphemeSizes.s10),
                  ),
                ),
                builder: (contextBottomSheet) => MorphemeBottomSheetFullImage(
                  photoFile: indexFile != null &&
                          photoFile != null &&
                          indexFile < photoFile.length
                      ? photoFile[indexFile]
                      : null,
                  photoUrl: indexUrl != null &&
                          photoUrl != null &&
                          indexUrl < photoUrl.length
                      ? photoUrl[indexUrl]
                      : null,
                ),
              ),
            ),
          ],
          if (isPhotoValid == false) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MorphemeSizes.s16,
              ),
              child: MorphemeStatusMessage.error(
                context: context,
                text: context.s.emptyError,
              ),
            )
          ],
          const Expanded(
            child: MorphemeSpacing.vertical52(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: MorphemeSizes.s16,
              right: MorphemeSizes.s16,
              bottom: MorphemeSizes.s16,
            ),
            child: MorphemeButton.elevated(
              key: const ValueKey('buttonCreateReport'),
              isLoading: createReportBloc is CreateReportLoading ||
                  editReportBloc is EditReportLoading ||
                  uploadFileState is UploadFileLoading,
              text: context.s.send,
              onPressed: () => context
                  .read<CreateReportCubit>()
                  .onSaveButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }
}
