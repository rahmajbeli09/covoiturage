import 'package:covo/core/services/repository/authentification_repo/exceptions/signup_email_password_failure.dart';
import 'package:covo/view/screen/auth/HomeScreen.dart';
import 'package:covo/view/screen/auth/login.dart';
import 'package:covo/view/screen/onBoarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthentificationRepository extends GetxController{
  static AuthentificationRepository get instance => Get.find(); 

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser ;

  @override
void onReady() {
  firebaseUser = Rx<User?>(_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges());
  ever(firebaseUser, _setInitialScreen);

  print("Utilisateur actuel: ${_auth.currentUser?.email}"); // Log l'utilisateur actuel
}


  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const Homescreen()) : Get.offAll(() =>const  OnBoarding());
  }

  Future<void> createUserWithEmailAndPassword(String email , String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(()=>const Login()) : Get.to(()=> const OnBoarding());
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code); 
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex ;
    }catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
    }

Future<UserCredential?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.code(e.code);
    } catch (e) {
      throw SignUpWithEmailAndPasswordFailure();
    }
  }


  Future<void> logout() async => await _auth.signOut();
   String? getCurrentUserEmail() {
    return _auth.currentUser?.email;
    }
}