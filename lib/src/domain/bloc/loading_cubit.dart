import 'package:bloc/bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void startLoading() {
    emit(true);
  }

  void stopLoading() {
    emit(false);
  }
}
