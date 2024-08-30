import 'package:covo/core/services/repository/covRepository.dart';
import 'package:flutter/material.dart';
import 'package:covo/data/model/usermodel.dart';
import 'package:covo/data/model/covModel.dart';

class ProfileSearch extends StatelessWidget {
  final UserModel user;

  const ProfileSearch({Key? key, required this.user}) : super(key: key);

  Future<List<CovModel>> _fetchUserTrajets() async {
    return await CovRepository().getUserTrajets(user.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Détails du Profil", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
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
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nom ?? "Nom non disponible",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email ?? "Email non disponible",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.num ?? "Numéro non disponible",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ses covoix',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<CovModel>>(
                future: _fetchUserTrajets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<CovModel> trajets = snapshot.data!;
                      return trajets.isNotEmpty
                          ? ListView.builder(
                              itemCount: trajets.length,
                              itemBuilder: (context, index) {
                                CovModel trajet = trajets[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
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
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(child: Text('Aucun covoix trouvé.'));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erreur: ${snapshot.error}'));
                    } else {
                      return const Center(child: Text('Aucun covoix trouvé.'));
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
    );
  }
}
