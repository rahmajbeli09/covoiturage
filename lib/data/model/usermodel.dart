import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id ;
  final String? nom ;
  final String? email ;
  final String? password ; 
  final String? num ;

  const UserModel({
    this.id ,
    required this.email,
    required this.nom,
    required this.password,
    required this.num
  });
   
   toJson(){
    return {
      "Nom" : nom ,
      "Email" : email,
      "Num" : num ,
      "MotDePasse" : password,
    };

    
   }
   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
      return UserModel(
        id:document.id,
        password: data["password"],
        nom: data["nom"],
        num: data["num"],
        email : data["email"]);
    }
}