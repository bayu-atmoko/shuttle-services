import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/upload_file/presentation/bloc/upload_file/upload_file_bloc.dart';
import 'package:profile/edit_profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:profile/edit_profile/presentation/widgets/edit_profile_header.dart';

import '../cubit/edit_profile_cubit.dart';

// TODO margin dropdown
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.profile,
  });

  final ExtraUser profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with MorphemeStatePage<EditProfilePage, EditProfileCubit> {
  @override
  EditProfileCubit setCubit() => locator<EditProfileCubit>()
    ..initialData(
      widget.profile,
    );

  @override
  Widget buildWidget(BuildContext context) {
    final editProfileState = context.watch<EditProfileBloc>().state;
    final uploadFileState = context.watch<UploadFileBloc>().state;

    final nameKey =
        context.select((EditProfileCubit element) => element.nameKey);
    final addressKey =
        context.select((EditProfileCubit element) => element.addressKey);
    final phoneKey =
        context.select((EditProfileCubit element) => element.phoneKey);
    final isGenderValid = context
        .select((EditProfileCubit element) => element.state)
        .isGenderValid;
    final isVehicleValid = context
        .select((EditProfileCubit element) => element.state)
        .isVehicleValid;

    return MorphemeScrollViewWithAppBar(
      tittle: context.s.editAccount,
      isExpanded: true,
      child: Column(
        children: [
          EditProfileHeader(
            profilePicture: widget.profile.profilePicture,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(MorphemeSizes.s16),
              child: Column(
                children: [
                  MorphemeTextField(
                    key: nameKey,
                    title: context.s.name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: context.s.fillInName),
                    validator: ValidatorValueHelper.validatorEmpty,
                    textInputAction: TextInputAction.next,
                  ),
                  const MorphemeSpacing.vertical16(),
                  MorphemeTextField(
                    key: phoneKey,
                    title: context.s.phone,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: context.s.fillInPhone),
                    validator: ValidatorValueHelper.validatorPhone,
                    textInputAction: TextInputAction.next,
                  ),
                  const MorphemeSpacing.vertical16(),
                  if (widget.profile.role.orEmpty().toLowerCase() ==
                      UserRoleEnum.petugas.value) ...[
                    MorphemeDropdown<String>(
                      title: context.s.vehicle,
                      hintText: context.s.selectVehicle,
                      isValid: isVehicleValid,
                      value: VehicleEnumHelper.getEnumBasedOnValue(
                        widget.profile.vehicle.orEmpty(),
                      )?.title,
                      items: [
                        VehicleEnum.truck.title,
                        VehicleEnum.miniTruck.title,
                        VehicleEnum.motor.title,
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: _dropdownItem(e),
                              ))
                          .toList(),
                      onChanged: (value) => context
                          .read<EditProfileCubit>()
                          .onVehicleChanged(value.orEmpty()),
                    ),
                    const MorphemeSpacing.vertical16(),
                  ],
                  MorphemeDropdown<String>(
                    title: context.s.gender,
                    hintText: context.s.selectGender,
                    isValid: isGenderValid,
                    value: GenderEnumHelper.getEnumBasedOnValue(
                      widget.profile.gender.orEmpty(),
                    )?.title,
                    items: [
                      GenderEnum.male.title,
                      GenderEnum.female.title,
                    ]
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: _dropdownItem(e),
                            ))
                        .toList(),
                    onChanged: (value) => context
                        .read<EditProfileCubit>()
                        .onGenderChanged(value.orEmpty()),
                  ),
                  const MorphemeSpacing.vertical16(),
                  MorphemeTextField(
                    key: addressKey,
                    title: context.s.address,
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(hintText: context.s.enterAddress),
                    validator: ValidatorValueHelper.validatorEmpty,
                    maxLines: 4,
                  ),
                  const Expanded(
                    child: MorphemeSpacing.vertical52(),
                  ),
                  MorphemeButton.elevated(
                    key: const ValueKey('buttonEditProfile'),
                    isLoading: editProfileState is EditProfileLoading ||
                        uploadFileState is UploadFileLoading,
                    text: context.s.change,
                    onPressed: () =>
                        context.read<EditProfileCubit>().onSaveButtonPressed(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _dropdownItem(String e) {
    return Padding(
      padding: const EdgeInsets.only(
        left: MorphemeSizes.s16,
      ),
      child: MorphemeText.titleMedium(
        e,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
