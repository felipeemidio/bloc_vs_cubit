import 'package:counter_app/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.empty()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));

      if(event.username != 'admin' || event.password != 'admin') {
        throw Exception('Invalid User');
      }

      emit(state.copyWith(status: LoginStatus.success, userName: 'Felipe'));
    } on Exception catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}