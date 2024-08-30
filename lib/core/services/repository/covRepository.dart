import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/model/covModel.dart';

class CovRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addCov(CovModel cov) async {
    try {
      await _db.collection('cov').add(cov.toJson());
    } catch (e) {
    }
  }

  Future<List<CovModel>> getUserTrajets(String userId) async {
    final snapshot = await _db.collection('cov').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => CovModel.fromSnapshot(doc)).toList();
  }

  Future<List<CovModel>> getAllTrajets() async {
    try {
      final snapshot = await _db.collection('cov').get();
      if (snapshot.docs.isEmpty) {
      }
      return snapshot.docs.map((doc) => CovModel.fromSnapshot(doc)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> updateTrajet(String id, int newNbPlacedispo) async {
    try {
      final docRef = _db.collection('cov').doc(id);
      await docRef.update({
        'nbPlacedispo': newNbPlacedispo,
        'dispo': newNbPlacedispo > 0, // Mettre à jour dispo en fonction de nbPlacedispo
      });
    } catch (e) {
    }
  }
}
