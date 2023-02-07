import 'package:counter_app/counter/counter_bloc_page.dart';
import 'package:counter_app/counter/counter_cubit_page.dart';
import 'package:counter_app/login/login_bloc_page.dart';
import 'package:counter_app/login/login_cubit_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter App'),),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CounterBlocPage()),
                    ),
                    child: const Text('Counter Bloc Page'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CounterCubitPage()),
                    ),
                    child: const Text('Counter Cubit Page'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginBlocPage()),
                    ),
                    child: const Text('Login Bloc Page'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginCubitPage()),
                    ),
                    child: const Text('Login Cubit Page'),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
