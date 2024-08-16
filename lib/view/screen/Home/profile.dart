import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none, // Permet au cercle de déborder
                children: [
                  Container(
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                    color:const Color.fromARGB(255, 211, 150, 19),
                  ),
                  Positioned(
                    bottom: -50, // Déplace la moitié du cercle en dehors du Container
                    left: MediaQuery.of(context).size.width / 2 - 75, // Centre le cercle horizontalement
                    child: Container(
                      width: 150, // Diamètre du cercle
                      height: 150, // Diamètre du cercle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Couleur du cercle, vous pouvez mettre une image ici
                        border: Border.all(
                          color:const  Color.fromARGB(255, 206, 101, 27),
                          width: 2.0, // Largeur de la bordure
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 100 , right: 100 , left: 100),
                child: Column(children: [
                  Row(children: [
                    Icon(Icons.person_2),
                    Text("Rahmoushette"),
                    Icon(Icons.edit),
                  ],)
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
