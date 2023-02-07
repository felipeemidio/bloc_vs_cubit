enum LoginStatus {
  idle,
  loading,
  success,
  failure,
}

class LoginState {
  final LoginStatus status;
  final String? userName;
  final String? errorMessage;

  LoginState({
    required this.status,
    required this.userName,
    required this.errorMessage,
  });

  factory LoginState.empty() {
    return LoginState(
      status: LoginStatus.idle,
      userName: null,
      errorMessage: null,
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    String? userName,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}