import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/HomeController.dart';
import '../../../core/constant/imageasset.dart';
import 'demande.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bienvenue A Covoix", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Zone de recherche
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: controller.toggleSearchField,
                        child: Image.asset(
                          Imageasset.search,
                          height: 35,
                        ),
                      ),
                      Obx(() {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: controller.showSearchField.value ? 350.0 : 0.0,
                          curve: Curves.linear,
                          child: controller.showSearchField.value
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: TextField(
                                    controller: controller.searchController,
                                    decoration: InputDecoration(
                                      hintText: 'Rechercher par nom...',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onChanged: (query) {
                                      controller.searchUsers(query);
                                    },
                                  ),
                                )
                              : Container(),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Boutons de filtrage et affichage
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return ElevatedButton(
                          onPressed: () {
                            controller.toggleFilter();
                          },
                          child: Text(controller.isFiltered.value ? 'Afficher Tous' : 'Afficher Disponibles'),
                        );
                      }),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          controller.applyFilterOption(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(value: 'prix', child: Text('Filtrer par prix')),
                            const PopupMenuItem(value: 'depart', child: Text('Filtrer par point de départ')),
                          ];
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.filter_list),
                            SizedBox(width: 8),
                            Text('Filtrer'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (controller.showDepartFilter.value) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: controller.departFilterController,
                        decoration: const InputDecoration(
                          labelText: 'Point de départ',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          controller.applyDepartFilter(value);
                        },
                      ),
                    );
                  }
                  return Container();
                }),
                const SizedBox(height: 10),
                // Liste des trajets
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Obx(() {
                      return controller.allTrajets.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.filteredTrajets.length,
                              itemBuilder: (context, index) {
                                final trajet = controller.filteredTrajets[index];
                                return Hero(
                                  tag: 'trajet-${trajet.id}-$index',
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => Demande(trajet: trajet));
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'De: ${trajet.depart}',
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'À: ${trajet.destination}',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Départ: ${trajet.heuredep}',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Retour: ${trajet.heureRentre}',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Places disponibles: ${trajet.nbPlacedispo}',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Prix: ${trajet.prix}',
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                            Text(
                                              'Disponibilité: ${trajet.dispo ? "Disponible" : "Indisponible"}',
                                              style: TextStyle(
                                                color: trajet.dispo ? Colors.green : Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Aucun trajet trouvé.'),
                            );
                    }),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
