class SignUpFailure {
  final String message;

  const SignUpFailure({this.message = "An Unknown error occurred"});

  factory SignUpFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpFailure(message: "Please enter a strong password.");
      case "invalid-email":
        return const SignUpFailure(message: "Please enter a valid email.");
      case "user-disabled":
        return const SignUpFailure(message: "This user has been disabled. Please contact support for help.");
      default:
        return const SignUpFailure();
    }
  }
}
