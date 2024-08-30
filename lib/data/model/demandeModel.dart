import 'package:cloud_firestore/cloud_firestore.dart';

class DemandeModel {
  final String? id;
  final String userId;
  final String covId;
  final String status;


 DemandeModel({
    this.id,
    required this.userId,
    required this.covId,
    required this.status,
  });

  factory DemandeModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return DemandeModel(
      id: snapshot.id,
      userId: data['userId'],
      covId: data['covId'],
      status: data['status'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'covId': covId,
      'status': status,
      
    };
  }
}
