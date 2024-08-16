import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covo/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  
  createUser(UserModel user) async {
   await  _db.collection("users").add(user.toJson()).whenComplete(
      ()=>Get.snackbar("Success", "Your account has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.white
      )
    );
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
  Future<List<UserModel>> getAllUsers() async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}