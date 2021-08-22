import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_map/src/domain/repository/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState('', false, ''));

  final AuthenticationRepository _authenticationRepository;

  void userChanged(String name) {
    emit(state.copyWith(username: name));
  }

  void phoneChanged(String name) {
    emit(state.copyWith(phone: name));
  }

  Future<void> register() async {
    emit(state.copyWith(loading: true));
    try {
      await _authenticationRepository.register(state.username, state.username);
    } catch (error) {
      print(error);
    }
    emit(state.copyWith(loading: false));
  }
}
