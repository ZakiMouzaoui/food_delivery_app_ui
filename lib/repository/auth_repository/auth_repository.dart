import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app_ui/repository/auth_repository/exceptions/sign_up_exception.dart';
import 'package:food_delivery_app_ui/routes/routes.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = "".obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.welcome);
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpFailure.code(e.code);
    } catch (_) {
      throw const SignUpFailure();
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (firebaseUser.value != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.welcome);
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpFailure.code(e.code);
    } catch (_) {
      throw const SignUpFailure();
    }
  }

  Future<void> authenticatePhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == "invalid-phone-number") {
            Get.snackbar("Error", "The provided phone number is not valid");
          } else {
            Get.snackbar("Error", "Something went wrong. Please try again");
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    final credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
