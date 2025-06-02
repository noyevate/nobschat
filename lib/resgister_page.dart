import 'package:flutter/material.dart';
import 'package:nobschat/core/theme.dart';
import 'package:nobschat/login_page.dart';

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
    _printInputValues();
    super.dispose();
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
              _buildTextInput("username", Icons.person, _username),
              SizedBox(height: 10,),
              _buildTextInput("email", Icons.mail, _email),
              SizedBox(height: 10,),
              _buildTextInput("password", Icons.person, _pssword, isPassword: true),
              SizedBox(height: 20,),
              _buildResgisterButton(),
              SizedBox(height: 20,),
              _buildLoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(String hintText, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(5),
      
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey,),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildResgisterButton() {
    return  ElevatedButton(
      onPressed: () {
        _printInputValues();
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        
      ),
      child: Text("Register", style: TextStyle(color: Colors.white),),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage(),),);
        },
        child: RichText(text: TextSpan(
          text: "Already have an account? ", style: TextStyle(color: Colors.white, fontSize: 10),
          children: [
            TextSpan(
              text: "Click here to login",
              style: TextStyle(color: Colors.blue,fontSize: 10),
            )
          ]
        )),
      ),
        );
  }
}