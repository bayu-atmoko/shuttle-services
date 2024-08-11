import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile/data/models/body/logout_body.dart';
import 'package:profile/profile/data/models/body/profile_body.dart';
import 'package:profile/profile/domain/entities/profile_entity.dart';
import 'package:profile/profile/presentation/bloc/logout/logout_bloc.dart';
import 'package:profile/profile/presentation/bloc/profile/profile_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends MorphemeCubit<ProfileStateCubit> {
  ProfileCubit({
    required this.profileBloc,
    required this.logoutBloc,
  }) : super(const ProfileStateCubit());

  final ProfileBloc profileBloc;
  final LogoutBloc logoutBloc;

  @override
  void initState(BuildContext context) async {
    fetchProfile();
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<ProfileBloc>(create: (context) => profileBloc),
        BlocProvider<LogoutBloc>(create: (context) => logoutBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<ProfileBloc, ProfileState>(listener: _listenerProfile),
        BlocListener<LogoutBloc, LogoutState>(listener: _listenerLogout),
      ];

  @override
  void dispose() {
    profileBloc.close();
    logoutBloc.close();
  }

  void fetchProfile() {
    profileBloc.add(FetchProfile(const ProfileBody()));
  }

  void fetchLogout() {
    logoutBloc.add(FetchLogout(const LogoutBody()));
  }

  void _listenerProfile(BuildContext context, ProfileState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        emit(this.state.copyWith(
              profile: state.data.data,
            ));
      },
    );
  }

  void _listenerLogout(BuildContext context, LogoutState state) {
    state.when(
      onFailed: (state) => context.showSnackBar(
        MorphemeSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: context.s.thereAreTechError,
        ),
      ),
      onSuccess: (state) {
        context.goToLogin();
      },
    );
  }
}
