class LoginValidation{
  static String? validateEmail(String? email){
    return email == null || email.isEmpty ? "Email is required" : null;
  }

  static String? validatePassword(String? pwd){
    return pwd == null || pwd.isEmpty ? "Password is required" : null;
  }
}