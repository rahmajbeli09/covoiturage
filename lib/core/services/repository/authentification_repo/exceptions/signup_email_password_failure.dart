class SignUpWithEmailAndPasswordFailure {
  final String message ;
  const SignUpWithEmailAndPasswordFailure([this.message ="An Unkown error occurred."]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
      return const  SignUpWithEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid_email' :
      return const  SignUpWithEmailAndPasswordFailure('Email is not valid or badly fomatted.');
      case 'email-already-in-use' :
      return const  SignUpWithEmailAndPasswordFailure('An account already exists for that email.');
      case 'operation -not-allowed' :
      return const  SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support for help.');
      case 'user-disabled' :
      return const  SignUpWithEmailAndPasswordFailure('this user has been disabled. Please contact support for help');
      default:
      return SignUpWithEmailAndPasswordFailure();
    }
  }
}