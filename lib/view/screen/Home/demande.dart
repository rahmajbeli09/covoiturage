import 'package:covo/core/services/repository/demandeRepository.dart';
import 'package:covo/data/model/covModel.dart';
import 'package:covo/data/model/demandeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/repository/covRepository.dart';

import 'package:firebase_auth/firebase_auth.dart'; // Assurez-vous d'importer Firebase Auth

class Demande extends StatelessWidget {
  final CovModel trajet;

  const Demande({Key? key, required this.trajet}) : super(key: key);

  Future<void> decrementPlacesDisponibles() async {
    final userId = FirebaseAuth.instance.currentUser?.uid; // Récupérer l'ID de l'utilisateur connecté
    if (userId == null) {
      Get.snackbar(
        'Erreur',
        'Utilisateur non connecté.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (trajet.nbPlacedispo > 0) {
      try {
        final newNbPlacedispo = trajet.nbPlacedispo - 1;
        await CovRepository().updateTrajet(trajet.id!, newNbPlacedispo);

        // Ajouter la demande dans Firestore
        final demande = DemandeModel(
          userId: userId,
          covId: trajet.id!,
          status: 'en attente', // Définir le statut comme 'en attente' ou selon votre logique
        );
        await DemandeRepository().addDemande(demande);

        Get.snackbar(
          'Succès',
          'Votre demande a été envoyée. Places disponibles: $newNbPlacedispo',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Impossible de mettre à jour le trajet ou d\'ajouter la demande. Veuillez réessayer.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Indisponible',
        'Le trajet n\'est plus disponible.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande pour aller à ${trajet.destination}'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Départ: ${trajet.heuredep}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
            const SizedBox(height: 8),
            Text('Retour: ${trajet.heureRentre}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
            const SizedBox(height: 8),
            Text('Places disponibles: ${trajet.nbPlacedispo}', style:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
            const SizedBox(height: 8),
            Text('Disponibilité: ${trajet.dispo ? "Disponible" : "Indisponible"}', 
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter", color: trajet.dispo ? Colors.green : Colors.red)),
            const SizedBox(height: 16),
            Container(
               padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
                           color:  Color.fromARGB(255, 211, 150, 19),
            ),
              child: MaterialButton(
                onPressed: trajet.dispo ? decrementPlacesDisponibles : () {
                  Get.snackbar(
                    'Indisponible',
                    'Le trajet n\'est plus disponible.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                },
                child: const Text('Envoyer la demande'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
