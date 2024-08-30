import 'package:cloud_firestore/cloud_firestore.dart';

class CovModel {
  final String? id;
  final String depart;
  final String destination;
  final String heureRentre;
  final String heuredep;
  final int nbPlacedispo;
  final int nbPlacetotal;
  final String userId;
  final bool dispo;
  final double prix; // Ajout du champ prix

  CovModel({
    this.id,
    required this.depart,
    required this.destination,
    required this.heureRentre,
    required this.heuredep,
    required this.nbPlacedispo,
    required this.nbPlacetotal,
    required this.userId,
    required this.dispo,
    required this.prix, // Initialisation du champ prix
  });

  factory CovModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CovModel(
      id: snapshot.id,
      depart: data['depart'],
      destination: data['destination'],
      heureRentre: data['heureRentre'],
      heuredep: data['heuredep'],
      nbPlacedispo: data['nbPlacedispo'],
      nbPlacetotal: data['nbPlacetotal'],
      userId: data['userId'],
      dispo: data['dispo'],
      prix: (data['prix'] as num).toDouble(), // Conversion à double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'depart': depart,
      'destination': destination,
      'heureRentre': heureRentre,
      'heuredep': heuredep,
      'nbPlacedispo': nbPlacedispo,
      'nbPlacetotal': nbPlacetotal,
      'userId': userId,
      'dispo': dispo,
      'prix': prix, // Ajout du champ prix à la sérialisation
    };
  }
}
