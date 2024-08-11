import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile/domain/entities/profile_entity.dart';
import 'package:profile/profile/presentation/cubit/profile_cubit.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final profile =
        context.select((ProfileCubit element) => element.state).profile;

    return Container(
      width: double.infinity,
      height: MorphemeSizes.s220,
      color: context.color.primaryDark,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (profile?.profilePicture ?? '').isNotNullOrEmpty
              ? _imageNetwork(context, profile)
              : _defaultPhoto(context),
          MorphemeText.titleMedium(
            profile?.name ?? '',
            color: context.color.white,
          ),
          MorphemeText.titleSmall(
            profile?.email ?? '',
            color: context.color.white,
          ),
        ],
      ),
    );
  }

  Padding _imageNetwork(BuildContext context, DataProfile? profile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MorphemeSizes.s6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MorphemeSizes.s6),
        child: Container(
          color: context.color.white,
          child: MorphemeImageAsset(
            profile?.profilePicture ?? '',
            width: MorphemeSizes.s70,
            height: MorphemeSizes.s70,
            fit: BoxFit.cover,
            errorWidget: (
              context,
              url,
              error,
            ) =>
                _defaultPhoto(
              context,
              size: MorphemeSizes.s70,
            ),
          ),
        ),
      ),
    );
  }

  Icon _defaultPhoto(
    BuildContext context, {
    double? size,
  }) {
    return Icon(
      Icons.account_box_rounded,
      size: size ?? MorphemeSizes.s80,
      color: context.color.white,
    );
  }
}
