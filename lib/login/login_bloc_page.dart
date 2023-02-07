import 'package:counter_app/login/login_bloc.dart';
import 'package:counter_app/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocPage extends StatefulWidget {
  const LoginBlocPage({super.key});

  @override
  State<LoginBlocPage> createState() => _LoginBlocPageState();
}

class _LoginBlocPageState extends State<LoginBlocPage> {
  late final LoginBloc _loginBloc;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    _loginBloc = LoginBloc();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
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
        title: const Text('BLOC LOGIN'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
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
                  BlocBuilder<LoginBloc, LoginState>(
                    bloc: _loginBloc,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.status == LoginStatus.loading ? null : () => _loginBloc.add(
                          LoginEvent(
                            username: userNameController.text,
                            password: passwordController.text,
                          ),
                        ),
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
