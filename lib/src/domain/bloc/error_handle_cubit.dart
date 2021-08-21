import 'package:bloc/bloc.dart';

class ErrorHandlerCubit extends Cubit<ErrorType> {
  ErrorHandlerCubit() : super(ErrorType.noError) {
    instance = this;
  }

  static late ErrorHandlerCubit instance;

  void showError(ErrorType type) {
    emit(type);
    emit(ErrorType.noError);
  }
}

enum ErrorType { wrongCredentials, serverError, noError }
