import 'dart:io';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    required this.profilePicture,
  });

  final String? profilePicture;

  @override
  Widget build(BuildContext context) {
    final photoFile =
        context.select((EditProfileCubit element) => element.state).photoFile;

    return Container(
      width: double.infinity,
      height: MorphemeSizes.s120,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      color: context.color.primaryDark,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(MorphemeSizes.s5),
            child: _photoFile(
              photoFile,
              context,
              profilePicture,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: MorphemeTapDetector(
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
                          .read<EditProfileCubit>()
                          .updatePhoto(value, context);
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: context.color.white,
                  borderRadius: BorderRadius.circular(
                    MorphemeSizes.s3,
                  ),
                  border: Border.all(color: context.color.grey),
                ),
                padding: const EdgeInsets.all(MorphemeSizes.s5),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: MorphemeSizes.s20,
                  color: context.color.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _defaultPhoto(BuildContext context) {
    return Icon(
      Icons.account_box_rounded,
      size: MorphemeSizes.s80,
      color: context.color.white,
    );
  }

  Widget _photoFile(
    XFile? photoFile,
    BuildContext context,
    String? profileImage,
  ) {
    final path = photoFile?.path ?? "";
    return photoFile != null && path.isNotEmpty
        ? _containerPhoto(
            context,
            Image.file(
              File(path),
              height: MorphemeSizes.s70,
              width: MorphemeSizes.s70,
              fit: BoxFit.cover,
            ),
          )
        : profileImage.isNotNullOrEmpty
            ? _photoNetwork(context, profileImage)
            : _defaultPhoto(context);
  }

  Widget _photoNetwork(BuildContext context, String? profileImage) {
    return _containerPhoto(
      context,
      MorphemeImageAsset(
        profileImage.orEmpty(),
        height: MorphemeSizes.s70,
        width: MorphemeSizes.s70,
        fit: BoxFit.cover,
        errorWidget: (
          context,
          url,
          error,
        ) =>
            _defaultPhoto(context),
      ),
    );
  }

  ClipRRect _containerPhoto(BuildContext context, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MorphemeSizes.s6),
      child: Container(
        color: context.color.white,
        child: child,
      ),
    );
  }
}
