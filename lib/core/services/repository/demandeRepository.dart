import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covo/data/model/demandeModel.dart';

class DemandeRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addDemande(DemandeModel demande) async {
    try {
      await _db.collection('demande').add(demande.toJson());
    } catch (e) {
    }
  }

}
