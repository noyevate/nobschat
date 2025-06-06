abstract class AuthEvent {
  
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String username;
  final String password;


  RegisterEvent({required this.email, required this.username, required this.password});}


class LoginEvent extends AuthEvent{
   final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}