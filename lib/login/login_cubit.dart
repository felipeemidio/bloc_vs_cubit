import 'package:counter_app/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.empty());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));

      if(username!= 'admin' || password != 'admin') {
        throw Exception('Invalid User');
      }

      emit(state.copyWith(status: LoginStatus.success, userName: 'Felipe'));
    } on Exception catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}