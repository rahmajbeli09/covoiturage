import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/Home/TextFieldCov.dart';
import 'package:covo/controller/home/addController.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddController controller = Get.put(AddController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bienvenue A Covoix", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Ajoutez Votre proposition de covoix \n et attendez les demandes ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      TextFieldCov(
                        hint: "Lieux de départ",
                        label: "Lieux de départ",
                        controller: controller.departController,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCov(
                        hint: "Destination",
                        label: "Destination",
                        controller: controller.destinationController,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCov(
                        hint: "Heure de départ",
                        label: "HH:mm:ss",
                        controller: controller.heuredepController,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCov(
                        hint: "Heure de rentrée",
                        label: "HH:mm:ss",
                        controller: controller.heureRentreController,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCov(
                        hint: "Prix",
                        label: "Prix",
                        controller: controller.prixController, // Ajout du contrôleur pour le prix
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          labelText: "Nombre de places disponibles",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        ),
                        value: controller.nbPlacedispo.value,
                        onChanged: (int? newValue) {
                          if (newValue != null) {
                            controller.nbPlacedispo.value = newValue;
                          }
                        },
                        items: [1, 2, 3, 4, 5, 6, 7].map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 211, 150, 19),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            controller.addTrajet();
                          },
                          child: const Text("Ajouter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
