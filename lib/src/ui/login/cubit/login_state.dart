part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = const Username.pure(),
    this.status = FormzStatus.pure,
  });

  final Username username;
  final FormzStatus status;

  @override
  List<Object> get props => [username, status];

  LoginState copyWith({
    Username? username,
    FormzStatus? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      status: status ?? this.status,
    );
  }
}
