import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:covo/data/model/usermodel.dart';
import 'package:get/get.dart';
import 'package:covo/core/services/repository/userRepository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthentificationRepository());
  final _userRepo = Get.put(UserRepository());

   @override
  void onInit() {
    super.onInit();
    getUserData();
  }


    getUserData(){
      final email = _authRepo.firebaseUser.value?.email;
      if(email != null){
       return _userRepo.getUserDetails(email);
      }else{
        Get.snackbar("Erreur", "Login to continue");
      }
    }
  var isEditingName = false.obs;
  var isEditingEmail = false.obs;
  var isEditingPhone = false.obs;

 

  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
    getUserData();
  }
}