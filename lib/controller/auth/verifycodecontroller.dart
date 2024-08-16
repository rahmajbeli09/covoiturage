import 'package:covo/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  toResetPassword();
}
class VerifyCodeControllerImp extends VerifyCodeController{
  late String code;
  @override
  toResetPassword() {
    Get.offAllNamed(AppRoute.reset);
  }
  @override
  void onInit() {
    super.onInit();
  }

}