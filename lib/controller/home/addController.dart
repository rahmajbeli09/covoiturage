import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covo/data/model/covModel.dart';
import '../../core/services/repository/covRepository.dart';
import '../../core/services/repository/userRepository.dart';
import '../../data/model/usermodel.dart';

class AddController extends GetxController {
  final departController = TextEditingController();
  final destinationController = TextEditingController();
  final heuredepController = TextEditingController();
  final heureRentreController = TextEditingController();
  final prixController = TextEditingController(); // Ajout du contrôleur pour le prix
  var nbPlacedispo = 1.obs;

  void addTrajet() async {
    String? userEmail = AuthentificationRepository.instance.getCurrentUserEmail();
    if (userEmail != null) {
      UserModel? user = await UserRepository().getUserDetails(userEmail);
      if (user != null) {
        final prix = double.tryParse(prixController.text.trim()) ?? 0.0; // Conversion du prix en double

        final cov = CovModel(
          depart: departController.text.trim(),
          destination: destinationController.text.trim(),
          heuredep: heuredepController.text.trim(),
          heureRentre: heureRentreController.text.trim(),
          nbPlacedispo: nbPlacedispo.value,
          nbPlacetotal: nbPlacedispo.value,
          userId: user.id!,
          dispo: nbPlacedispo.value > 0, // Disponibilité basée sur le nombre de places
          prix: prix, // Ajout du prix
        );

        await CovRepository().addCov(cov);
        Get.snackbar('Succès', 'Trajet ajouté avec succès');
        
        // Vider le formulaire
        departController.clear();
        destinationController.clear();
        heuredepController.clear();
        heureRentreController.clear();
        prixController.clear(); // Vider le contrôleur du prix
        
        nbPlacedispo.value = 1; 
      } else {
        Get.snackbar('Erreur', 'Utilisateur non trouvé');
      }
    } else {
      Get.snackbar('Erreur', 'Aucun utilisateur connecté');
    }
  }
}
