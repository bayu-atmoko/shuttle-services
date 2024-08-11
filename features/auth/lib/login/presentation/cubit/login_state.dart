part of 'login_cubit.dart';

class LoginStateCubit extends Equatable {
  const LoginStateCubit({
    this.isRememberMe = false,
  });

  final bool isRememberMe;

  LoginStateCubit copyWith({
    bool? isRememberMe,
  }) {
    return LoginStateCubit(
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [
        isRememberMe,
      ];
}
