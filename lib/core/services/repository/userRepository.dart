import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covo/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.put(UserRepository());

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

Future<UserModel?> getUserDetails(String email) async {
  final snapshot = await _db.collection("users").where("Email", isEqualTo: email).get();
  if (snapshot.docs.isNotEmpty) {
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
  return null; 
}

  Future<List<UserModel>> getAllUsers() async{
    final snapshot = await _db.collection("users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
  Future<void> updateUserRecord(UserModel user) async {
  if (user.id != null) {
    final docRef = _db.collection("users").doc(user.id);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update(user.toJson());
    } else {
      Get.snackbar("Erreur", "Le document est introuvable.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.white);
    }
  } else {
    Get.snackbar("Erreur", "L'ID de l'utilisateur est null.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.white);
  }
}
Future<List<UserModel>> searchUsersByName(String name) async {
    final snapshot = await _db.collection("users")
      .where("Nom", isGreaterThanOrEqualTo: name)
      .where("Nom", isLessThanOrEqualTo: name + '\uf8ff')
      .get();

    return snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();}


}