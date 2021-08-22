part of 'login_cubit.dart';

class LoginState {
  final String username;
  final bool loading;
  final String phone;

  LoginState(this.username, this.loading, this.phone);

  LoginState copyWith({String? username, bool? loading, String? phone}) =>
      LoginState(username ?? this.username, loading ?? this.loading, phone ?? this.phone);
}
