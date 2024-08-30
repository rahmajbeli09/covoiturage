import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/ProfileController.dart';
import '../../../data/model/covModel.dart';
import '../../../data/model/usermodel.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                final nameController = TextEditingController(text: userData.nom);
                final emailController = TextEditingController(text: userData.email);
                final phoneController = TextEditingController(text: userData.num);
                final passwordController = TextEditingController(text: userData.password);

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width,
                            color: const Color.fromARGB(255, 211, 150, 19),
                          ),
                          Positioned(
                            bottom: -50,
                            left: MediaQuery.of(context).size.width / 2 - 75,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 206, 101, 27),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 100, right: 50, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Row(
                              children: [
                                Expanded(
                                  child: controller.isEditingName.value
                                      ? TextFormField(
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                            hintText: 'Nom non disponible',
                                            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                                          ),
                                        )
                                      : Text(nameController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
                                ),
                              ],
                            )),
                            const SizedBox(height: 10),
                            Obx(() => Row(
                              children: [
                                Expanded(
                                  child: controller.isEditingEmail.value
                                      ? TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                            hintText: 'Email non disponible',
                                            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                                          ),
                                        )
                                      : Text(emailController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
                                ),
                              ],
                            )),
                            const SizedBox(height: 10),
                            Obx(() => Row(
                              children: [
                                Expanded(
                                  child: controller.isEditingPhone.value
                                      ? TextFormField(
                                          controller: phoneController,
                                          decoration: const InputDecoration(
                                            hintText: 'Numéro non disponible',
                                            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                                          ),
                                        )
                                      : Text(phoneController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
                                ),
                              ],
                            )),
                            const SizedBox(height: 10),
                            Obx(() => Row(
                              children: [
                                Expanded(
                                  child: controller.isEditingEmail.value
                                      ? TextFormField(
                                          controller: passwordController,
                                          decoration: const InputDecoration(
                                            hintText: 'Password non disponible',
                                            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                                          ),
                                        )
                                      : Text(passwordController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
                                ),
                              ],
                            )),
                            const SizedBox(height: 20),
                            Obx(() => ElevatedButton.icon(
                              icon: Icon(controller.isEditingName.value || controller.isEditingEmail.value || controller.isEditingPhone.value ? Icons.save : Icons.edit),
                              label: Text(controller.isEditingName.value || controller.isEditingEmail.value || controller.isEditingPhone.value ? 'Enregistrer' : 'Modifier'),
                              onPressed: () async {
                                if (controller.isEditingName.value || controller.isEditingEmail.value || controller.isEditingPhone.value) {
                                  // Sauvegarder les modifications
                                  UserModel updatedUser = UserModel(
                                    id: userData.id,  // Passer l'ID de l'utilisateur ici
                                    nom: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    num: phoneController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                  await controller.updateRecord(updatedUser);
                                  controller.isEditingName.value = false;
                                  controller.isEditingEmail.value = false;
                                  controller.isEditingPhone.value = false;
                                } else {
                                  // Passer en mode édition
                                  controller.isEditingName.value = true;
                                  controller.isEditingEmail.value = true;
                                  controller.isEditingPhone.value = true;
                                }
                              }
                            )),
                            // Trajets ajoutés par l'utilisateur connecté
                            const SizedBox(height: 20),
                           const Text('Mes covoix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                             Container(
                              height: 200, // Définir une hauteur pour le ListView
                              child: FutureBuilder<List<CovModel>>(
                                future: controller.getUserTrajets(userData.id!), // Utiliser l'ID de l'utilisateur
                                builder: (context, trajetSnapshot) {
                                  if (trajetSnapshot.connectionState == ConnectionState.done) {
                                    if (trajetSnapshot.hasData) {
                                      List<CovModel> trajets = trajetSnapshot.data!;
                                      return ListView.builder(
                                        itemCount: trajets.length,
                                        itemBuilder: (context, index) {
                                          CovModel trajet = trajets[index];
                                          return ListTile(
                                            title: Text('Covoix de ${trajet.depart} à ${trajet.destination}'),
                                            subtitle: Text('Départ: ${trajet.heuredep} - Retour: ${trajet.heureRentre}'),
                                          );
                                        },
                                      );
                                    } else if (trajetSnapshot.hasError) {
                                      return Text('Erreur: ${trajetSnapshot.error}');
                                    } else {
                                      return const Text('Aucun trajet trouvé.');
                                    }
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: Text("Something went wrong"));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
