import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_event.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_button.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_prompt.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:nobschat/resgister_page.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pssword = TextEditingController();

  void _printInputValues() {
    var email = _email.text.trim();
    var pass = _pssword.text.trim();

    print("email: $email");
    print("pass: $pass");
  }

  @override
  void dispose() {
    _email.dispose();
    _pssword.dispose();
    _printInputValues();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        email: _email.text.trim(), password: _pssword.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTextfield(
                hintText: "email",
                icon: Icons.mail,
                controller: _email,
                isPassword: false,
              ),
              SizedBox(
                height: 10,
              ),
              AuthTextfield(
                hintText: "password",
                icon: Icons.password,
                controller: _pssword,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthLoading) {
                  return 
                  Center(child: CircularProgressIndicator());
                }
                return AuthButton(
                  text: "Login",
                  onPressed: () {
                _onLogin();
                  },
                );
              }, listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, '/conversation_page');
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              }),
              SizedBox(
                height: 20,
              ),
              AuthPrompt(
                  text1: "don't have an account? ",
                  text2: "Click here to register",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ResgisterPage(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
