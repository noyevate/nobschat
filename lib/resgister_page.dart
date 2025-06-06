import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/login_page.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_event.dart';
import 'package:nobschat/features/auth/presentation/bloc/auth_state.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_button.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_prompt.dart';
import 'package:nobschat/features/auth/presentation/widgets/auth_textfield.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({super.key});

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pssword = TextEditingController();

  void _printInputValues() {
    var username = _username.text.trim();
    var email = _email.text.trim();
    var pass = _pssword.text.trim();

    print("username: $username");
    print("email: $email");
    print("pass: $pass");
  }

  @override
  void dispose() {
    _email.dispose();
    _pssword.dispose();
    _username.dispose();
    // _printInputValues();
    super.dispose();
  }

  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
        email: _email.text, username: _username.text, password: _pssword.text));
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
                hintText: "username",
                icon: Icons.person,
                controller: _username,
                isPassword: false,
              ),
              SizedBox(
                height: 10,
              ),
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
                  return Center(child: CircularProgressIndicator());
                }
                return AuthButton(
                  text: "Register",
                  onPressed: () {
                    _onRegister();
                  },
                );
              }, listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, '/login');
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
                  text1: "Already have an account? ",
                  text2: "Click here to login",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
