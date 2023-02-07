import 'package:counter_app/login/login_cubit.dart';
import 'package:counter_app/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubitPage extends StatefulWidget {
  const LoginCubitPage({super.key});

  @override
  State<LoginCubitPage> createState() => _LoginCubitPageState();
}

class _LoginCubitPageState extends State<LoginCubitPage> {
  late final LoginCubit _loginCubit;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    _loginCubit = LoginCubit();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginCubit.close();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _showSnackBar(BuildContext context, String text, Color color) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUBIT LOGIN'),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        bloc: _loginCubit,
        listener: (context, state) {
          switch(state.status) {
            case LoginStatus.success:
              _showSnackBar(context, 'Hello, ${state.userName!}', Colors.green);
              break;
            case LoginStatus.failure:
              _showSnackBar(context, state.errorMessage!, Colors.red);
              break;
            default:
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(label: Text('Username')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(label: Text('Password')),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<LoginCubit, LoginState>(
                    bloc: _loginCubit,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.status == LoginStatus.loading
                            ? null
                            : () => _loginCubit.login(userNameController.text, passwordController.text),
                        child: const Text('Login'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
