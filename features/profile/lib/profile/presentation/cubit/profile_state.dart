part of 'profile_cubit.dart';

class ProfileStateCubit extends Equatable {
  const ProfileStateCubit({
    this.profile,
  });

  final DataProfile? profile;

  ProfileStateCubit copyWith({
    DataProfile? profile,
  }) {
    return ProfileStateCubit(
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [
        profile,
      ];
}
